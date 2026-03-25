import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  await DatabaseHelper.instance.initializeUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final userMaps = await DatabaseHelper.instance.queryAllUsers();
    setState(() {
      users = userMaps.map((map) => User.fromMap(map)).toList();
    });
  }

  Future<void> _deleteUser(int userId) async {
    await DatabaseHelper.instance.deleteUser(userId);
    await _fetchUsers();
  }

  Future<void> _deleteAllUsers() async {
    await DatabaseHelper.instance.deleteAllUsers();
    await _fetchUsers();
  }

  void _editUser(User user) {
    TextEditingController usernameController = TextEditingController(
      text: user.username,
    );
    TextEditingController emailController = TextEditingController(
      text: user.email,
    );
    TextEditingController pwdController = TextEditingController(text: user.pwd);
    TextEditingController weightController = TextEditingController(
      text: user.weight.toString(),
    );
    TextEditingController heightController = TextEditingController(
      text: user.height.toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              User updatedUser = User(
                id: user.id,
                username: usernameController.text,
                email: emailController.text,
                pwd: pwdController.text,
                weight: double.parse(weightController.text),
                height: double.parse(heightController.text),
              );
              await DatabaseHelper.instance.updateUser(updatedUser);
              await _fetchUsers();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _addUser() {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New User'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              User newUser = User(
                username: usernameController.text,
                email: emailController.text,
                pwd: pwdController.text,
                weight: double.parse(weightController.text),
                height: double.parse(heightController.text),
              );
              await DatabaseHelper.instance.insertUser(newUser);
              await _fetchUsers();
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Users List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _deleteAllUsers,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          Color cardColor;
          switch (user.bmiType) {
            case "Underweight":
              cardColor = Colors.blue.shade50;
              break;
            case "Normal weight":
              cardColor = Colors.green.shade50;
              break;
            case "Risk to Overweight":
              cardColor = Colors.yellow.shade50;
              break;
            case "Overweight":
              cardColor = Colors.orange.shade50;
              break;
            default:
              cardColor = Colors.red.shade50;
          }

          return Card(
            elevation: 5,
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "BMI ${user.bmi.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    user.bmiType,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Center(child: Image.asset(user.imagePath, height: 90)),

                  const SizedBox(height: 10),

                  user.bmiType == "Normal weight"
                      ? const Text(
                          "✅ Your weight is in Normal range",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      : user.bmi < 23
                      ? Text(
                          "⬆ Need to gain ${user.weightToAdjust.toStringAsFixed(2)} kg",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      : Text(
                          "⬇ Need to lose ${user.weightToAdjust.toStringAsFixed(2)} kg",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),

                  const SizedBox(height: 5),

                  Text(
                    "Target Weight: ${user.targetWeight.toStringAsFixed(2)} kg",
                    style: const TextStyle(fontSize: 13),
                  ),

                  const Divider(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editUser(user),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteUser(user.id!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
