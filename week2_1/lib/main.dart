import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.deepOrange),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  int padding = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1043-3 waranon")),
      body: Center(
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                "https://scontent-bkk1-1.xx.fbcdn.net/v/t39.30808-6/473706017_3512340112402425_2515988743076016897_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=022kLvmwoP0Q7kNvwFAEyPw&_nc_oc=AdmZt2l3O1pqLsPJhvv7chgszJNezzgbYLOPAV07QoklpeDQpaKr5EQSyyvwrqB4jlI&_nc_zt=23&_nc_ht=scontent-bkk1-1.xx&_nc_gid=zxcet0w7fMK3Lh4CVjuUjQ&oh=00_Afi1RNfxjgpXJyiYbpF0bueL16vlIb_eZhuT3Z8d-29Guw&oe=6933003E",
                scale: 1,
              ),
            ),
            Text(
              "กดปุ่ม เพิ่มค่าตัวเลข",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Text(number.toString(), style: TextStyle(fontSize: 30)),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  number--;
                });
              },
              child: Icon(Icons.abc),
            ),
          ],
        ),
      ),
    );
  }
}
