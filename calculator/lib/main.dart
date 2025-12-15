import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "MyApp", home: MyHomepage());
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int number = 0;
  String num1 = "";
  String num2 = "";
  String operator = "";
  String showValue = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator STF")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(showValue, style: TextStyle(fontSize: 40)),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "7";
                        showValue = num1;
                      } else {
                        num2 += "7";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("7"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "8";
                        showValue = num1;
                      } else {
                        num2 += "8";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("8"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "9";
                        showValue = num1;
                      } else {
                        num2 += "9";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("9"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "+";
                    });
                  },
                  child: Text("+"),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "4";
                        showValue = num1;
                      } else {
                        num2 += "4";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("4"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "5";
                        showValue = num1;
                      } else {
                        num2 += "5";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("5"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "6";
                        showValue = num1;
                      } else {
                        num2 += "6";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("6"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "-";
                    });
                  },
                  child: Text("-"),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "1";
                        showValue = num1;
                      } else {
                        num2 += "1";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("1"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "2";
                        showValue = num1;
                      } else {
                        num2 += "2";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("2"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "3";
                        showValue = num1;
                      } else {
                        num2 += "3";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("3"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "*";
                    });
                  },
                  child: Text("*"),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "0";
                        showValue = num1;
                      } else {
                        num2 += "0";
                        showValue = num2;
                      }
                    });
                  },
                  child: Text("0"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      num1 = "";
                      num2 = "";
                      operator = "";
                      showValue = "0";
                    });
                  },
                  child: Text(
                    "C",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  shape: CircleBorder(),
                  backgroundColor: Colors.purple[900],
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    /*  setState(() {
                      // Simple evaluation logic (only works for single operator)
                      List<String> parts;
                      int result = 0;
                      if (operator == "+") {
                        parts = num1.split("+");
                        result = int.parse(parts[0]) + int.parse(parts[1]);
                      } else if (operator == "-") {
                        parts = num1.split("-");
                        result = int.parse(parts[0]) - int.parse(parts[1]);
                      } else if (operator == "*") {
                        parts = num1.split("*");
                        result = int.parse(parts[0]) * int.parse(parts[1]);
                      } else if (operator == "/") {
                        parts = num1.split("/");
                        result = int.parse(parts[0]) ~/ int.parse(parts[1]);
                      }
                      showValue = result.toString();
                      num1 = showValue;
                      operator = "";
                    });*/
                    setState(() {
                      if (num1 == "" || num2 == "") {
                        return;
                      }
                      double n1 = double.parse(num1);
                      double n2 = double.parse(num2);
                      double result = 0;
                      if (operator == "+") {
                        result = n1 + n2;
                      } else if (operator == "-") {
                        result = n1 - n2;
                      } else if (operator == "*") {
                        result = n1 * n2;
                      } else if (operator == "/") {
                        result = n1 / n2;
                      }
                      showValue = result.toString();
                      num1 = showValue.toString();
                      num2 = "";
                    });
                  },

                  child: Text("="),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "/";
                    });
                  },
                  child: Text("/"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
