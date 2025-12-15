import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listview Widget',
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
  int number = 0;

  void _incrementCounter() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];

    data.add(
      Text(
        "กดปุ่มเพื่อเพิ่มค่าตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );
    data.add(Text(number.toString(), style: TextStyle(fontSize: 60)));
    data.add(Text("ทดสอบ List"));
    data.add(Text("ทดสอบ List"));
    data.add(Text("ทดสอบ List"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Hello Flutter"),
      ),

      body: Center(
        child: Column(mainAxisAlignment: .center, children: data),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
