import 'package:flutter/material.dart';

void main() {
  runApp(MyST());
}

class MyST extends StatelessWidget {
  const MyST({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New Calculator",
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String num1 = "";
  String num2 = "";
  String operator = "";
  String display = "0";

  Widget calcBtn(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 22)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("New Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(display, style: TextStyle(fontSize: 40, color: Colors.red)),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("7", () {}),
                calcBtn("8", () {}),
                calcBtn("9", () {}),
                calcBtn("+", () {}),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("4", () {}),
                calcBtn("5", () {}),
                calcBtn("6", () {}),
                calcBtn("-", () {}),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("1", () {}),
                calcBtn("2", () {}),
                calcBtn("3", () {}),
                calcBtn("*", () {}),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("0", () {}),
                calcBtn("C", () {}),
                calcBtn("=", () {}),
                calcBtn("/", () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
