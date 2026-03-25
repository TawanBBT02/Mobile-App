import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class ShowInf extends StatefulWidget {
  const ShowInf({Key? key}) : super(key: key);

  @override
  State<ShowInf> createState() => _ShowInfState();
}

class _ShowInfState extends State<ShowInf> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  List list = [];
  Future<String> listData() async {
    var url = Uri.http('192.168.1.133:5655', '/emp');
    var response = await http.get(url, headers: {"Accept": "application/json"});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        list = jsonDecode(response.body);
      });
    }
    return "Success";
  }

  // ฟังก์ชันเพิ่มข้อมูล (Create)
  Future<void> _saveData() async {
    var url = Uri.http('192.168.1.133:5655', '/create');
    var response = await http.post(
      url,
      body: {
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "address": _addressController.text,
        "age": _ageController.text,
        "department": _departmentController.text,
      },
    );

    if (response.statusCode == 200) {
      listData();
      Navigator.pop(context);
      _clearText();
    }
  }

  Future<void> _updateData(String id) async {
    var url = Uri.http('192.168.1.133:5655', '/update');
    var response = await http.post(
      url,
      body: {
        "id": id,
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "address": _addressController.text,
        "age": _ageController.text,
        "department": _departmentController.text,
      },
    );

    if (response.statusCode == 200) {
      listData();
      Navigator.pop(context);
      _clearText();
    }
  }

  Future<void> _deleteData(String id) async {
    var url = Uri.http('192.168.1.133:5655', '/delete/$id');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      listData();
      Navigator.pop(context);
    }
  }

  void _clearText() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    _ageController.clear();
    _departmentController.clear();
  }

  @override
  void initState() {
    super.initState();
    listData();
  }

  void _addNewDialog() {
    _clearText();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Member"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: "Address"),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: "Age"),
                ),
                TextField(
                  controller: _departmentController,
                  decoration: const InputDecoration(labelText: "Department"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(onPressed: () => _saveData(), child: const Text("Save")),
          ],
        );
      },
    );
  }

  // Dialog สำหรับแก้ไขข้อมูล
  void _showEdit(Map data) {
    _nameController.text = data['name'];
    _emailController.text = data['email'];
    _phoneController.text = data['phone'] ?? '';
    _addressController.text = data['address'] ?? '';
    _ageController.text = data['age'] ?? '';
    _departmentController.text = data['department'] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Member"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: "Address"),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: "Age"),
                ),
                TextField(
                  controller: _departmentController,
                  decoration: const InputDecoration(labelText: "Department"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => _updateData(data['id'].toString()),
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _showDel(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete?"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => _deleteData(id),
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DB Test")),
      body: Center(
        child: list.isEmpty
            ? const Text("No Data")
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Text(list[index]['id'].toString()),
                      title: Row(
                        children: [
                          Expanded(child: Text(list[index]['name'])),
                          Expanded(child: Text(list[index]['email'])),
                        ],
                      ),
                      trailing: Wrap(
                        spacing: 5,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              Map data = {
                                'id': list[index]['id'],
                                'name': list[index]['name'],
                                'email': list[index]['email'],
                                'phone': list[index]['phone'],
                                'address': list[index]['address'],
                                'age': list[index]['age'],
                                'department': list[index]['department'],
                              };
                              _showEdit(data);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                _showDel(list[index]['id'].toString()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addNewDialog();
        },
      ),
    );
  }
}
