import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final int number;

  const DisplayPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    bool isEven = number % 2 == 0;
    return Scaffold(
      appBar: AppBar(title: Text("Dispaly Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ตัวเลขที่กรอก : $number", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              isEven ? "เป็นเลขคู่" : "เป็นเลขคี่",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Image.asset(
              isEven ? "assets/images/pic2.jpg" : "assets/images/pic1.jpg",
              width: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
