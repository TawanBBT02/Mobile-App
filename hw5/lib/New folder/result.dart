import 'package:flutter/material.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  final String userNumber;
  final int money;

  const ResultPage({super.key, required this.userNumber, required this.money});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(
      999,
    ); // Generates a number between 0 and 999

    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลการตรวจรางวัล'),
        backgroundColor: const Color.fromARGB(255, 255, 176, 57),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 👈 สำคัญ
            children: [
              AlertDialog(
                title: const Text('ผลการตรวจรางวัล'),
                content: Text(
                  'เลขท้ายที่คุณเลือกคือ $userNumber \nเลขท้ายที่ออกคือ ${randomNumber.toString().padLeft(3, '0')} \nจำนวนเงินที่ซื้อคือ $money บาท',
                  textAlign: TextAlign.left, // 👈 ชิดซ้าย
                ),
                backgroundColor: Colors.orange[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              if (userNumber == randomNumber.toString().padLeft(3, '0') ||
                  userNumber == "999") ...[
                const SizedBox(height: 20),
                Text(
                  'ยินดีด้วย! คุณถูกรางวัลเลขท้าย 3 ตัว!\nได้รับเงินรางวัล ${money * 100} บาท',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ] else ...[
                const SizedBox(height: 20),
                const Text(
                  'เสียใจด้วย! คุณไม่ถูกรางวัลในครั้งนี้',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center, // ปุ่มยังอยู่กลาง
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('กลับไปเลือกใหม่'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
