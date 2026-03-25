import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String userNumber;
  final int money;

  const ResultPage({super.key, required this.userNumber, required this.money});

  String randomNumber() {
    Random r = Random();
    return '${r.nextInt(10)}${r.nextInt(10)}${r.nextInt(10)}';
  }

  @override
  Widget build(BuildContext context) {
    String luckyNumber = randomNumber();
    bool isWin = userNumber == luckyNumber;
    int reward = isWin ? money * 100 : 0;

    return Scaffold(
      appBar: AppBar(title: const Text('ผลการตรวจรางวัล')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เลขที่คุณซื้อ คือ $userNumber'),
            Text('จำนวนเงินที่คุณซื้อ คือ $money บาท'),
            const SizedBox(height: 10),
            Text('* เลขที่ออก คือ $luckyNumber'),
            const SizedBox(height: 10),

            isWin
                ? Column(
                    children: [
                      const Text('* ยินดีด้วยคุณถูกรางวัล'),
                      Text('* รับเงินรางวัล $reward บาท'),
                    ],
                  )
                : const Text('* เสียใจด้วย คุณไม่ถูกรางวัล'),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('คลิก กลับหน้าหลัก'),
            ),
          ],
        ),
      ),
    );
  }
}
