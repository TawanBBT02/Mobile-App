import 'package:week11_1/screen/simple_map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'current_location_screen.dart';

// ตรวจสอบชื่อ package ให้ตรงกับโปรเจกต์ของคุณ หรือใช้แบบ Relative import ด้านล่างนี้

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map New"), centerTitle: true),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // คำสั่งเปิดไปหน้าแผนที่
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => MapSample()));
              },
              child: const Text("Simple Map"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CurrentLocation();
                    },
                  ),
                );
              },
              child: const Text("Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}
