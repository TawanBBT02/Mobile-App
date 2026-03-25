import 'package:flutter/material.dart';
import 'shopping.dart';

class myForm extends StatefulWidget {
  const myForm({super.key});

  @override
  State<myForm> createState() => _myFormState();
}

class _myFormState extends State<myForm> {
  var _productName = "";
  var _customerName = "";

  void _updateProductName(val) {
    setState(() {
      _productName = val;
    });
  }

  void _updateCustomerName(val) {
    setState(() {
      _customerName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Form")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) => _updateProductName(value),
              decoration: InputDecoration(
                labelText: "Product Name",
                prefixIcon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) => _updateCustomerName(value),
              decoration: InputDecoration(
                labelText: "Customer Name",
                prefixIcon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formShopping(
                        productName: _productName,
                        customerName: _customerName,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                elevation: 15,
                shadowColor: Colors.blueAccent,
                shape: StadiumBorder(),
              ),
              child: Text("Submit"),
            ),

            SizedBox(height: 20),
            Text("Product Name: $_productName"),
            Text("Customer Name: $_customerName"),
          ],
        ),
      ),
    );
  }
}
