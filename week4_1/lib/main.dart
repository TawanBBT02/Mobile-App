import 'package:flutter/material.dart';
import 'foodMenu.dart';

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
  List<Foodmenu> foodmenus = [
    Foodmenu("ข้าวผัด", "30"),
    Foodmenu("ผัดกระเพรา", "40"),
    Foodmenu("ต้มยำกุ้ง", "50"),
    Foodmenu("ส้มตำ", "25"),
    Foodmenu("ลาบหมู", "35"),
  ];

  List<Widget> getData(int count) {
    List<Widget> data = [];
    data.add(
      Text(
        "กดปุ่มเพื่อเพิ่มค่าตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );
    for (int i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "Menu $i",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Text("sub-Menu $i"),
      );
      data.add(menu);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Hello Flutter"),
      ),

      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "Menu ${index + 1}",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
