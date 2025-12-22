import 'package:flutter/material.dart';
import 'MoneyBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Container BorderRadius")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 120,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InputDecoratorExample(),
              ),
              Moneybox("ยอดเงินคงเหลือ", 20000.519, 150, 20, Colors.blue),
              SizedBox(height: 20),
              Moneybox("รายรับ", 10000.255, 100.0, 20.0, Colors.green),
              SizedBox(height: 20),
              Moneybox("รายจ่าย", 150000.999, 100.0, 20.0, Colors.red),
              SizedBox(height: 20),
              Moneybox("ค้างจ่าย", 300000.9999, 100.0, 20.0, Colors.orange),
              SizedBox(height: 20),

              Container(
                child: TextButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputDecoratorExample extends StatelessWidget {
  const InputDecoratorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Account Name',
        labelStyle: MaterialStateTextStyle.resolveWith((
          Set<MaterialState> states,
        ) {
          final Color color = states.contains(MaterialState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.orange;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Please enter name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
