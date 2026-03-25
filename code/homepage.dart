import 'package:flutter/material.dart';
import 'result.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController digit1 = TextEditingController();
  final TextEditingController digit2 = TextEditingController();
  final TextEditingController digit3 = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  void checkResult() {
    String userNumber = digit1.text + digit2.text + digit3.text;
    int money = int.tryParse(moneyController.text) ?? 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(userNumber: userNumber, money: money),
      ),
    );
  }

  Widget numberBox(TextEditingController controller) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottery N3')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('เลือกเลขท้าย 3 หลัก'),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                numberBox(digit1),
                const SizedBox(width: 10),
                numberBox(digit2),
                const SizedBox(width: 10),
                numberBox(digit3),
              ],
            ),

            const SizedBox(height: 20),
            const Text('จำนวนเงินที่ต้องการซื้อ'),
            const SizedBox(height: 10),

            TextField(
              controller: moneyController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixText: 'บาท',
              ),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: checkResult,
              child: const Text('คลิก ตรวจรางวัล'),
            ),
          ],
        ),
      ),
    );
  }
}
