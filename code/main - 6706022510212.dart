import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenuPage(),
    );
  }
}

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  // เมนูอาหาร 20 รายการ (ชื่อ, ราคา, รูป, ประเภท)
  List<FoodMenu> menu = [
    FoodMenu("กระเพราหมูสับไข่ดาว", "60", "assets/images/m1.jpg", "ผัด"),
    FoodMenu("ผัดไทยกุ้งสด", "55", "assets/images/m2.jpg", "ผัด"),
    FoodMenu("ซูชิ", "100", "assets/images/m3.jpg", "ดิบ"),
    FoodMenu("BBQ", "90", "assets/images/m4.jpg", "ย่าง"),
    FoodMenu("ซาลาเปา", "40", "assets/images/m5.jpg", "นึ่ง"),
    FoodMenu("กุ้งเผา", "245", "assets/images/m6.jpg", "ย่าง"),
    FoodMenu("แกงจืดมะระ", "45", "assets/images/m7.jpg", "ต้ม"),
    FoodMenu("ปลาทอด", "80", "assets/images/m8.jpg", "ทอด"),
    FoodMenu("แหนมเนือง", "140", "assets/images/m9.jpg", "สด"),
    FoodMenu("เบอร์เกอร์", "69", "assets/images/m10.jpg", "ทอด"),
    FoodMenu("ข้าวมันไก่", "50", "assets/images/m11.jpg", "ต้ม"),
    FoodMenu("ส้มตำ", "45", "assets/images/m12.jpg", "ตำ"),
    FoodMenu("ไก่ทอด", "70", "assets/images/m13.jpg", "ทอด"),
    FoodMenu("หมูปิ้ง", "30", "assets/images/m14.jpg", "ย่าง"),
    FoodMenu("ต้มยำกุ้ง", "120", "assets/images/m15.jpg", "ต้ม"),
    FoodMenu("ข้าวผัด", "55", "assets/images/m16.jpg", "ผัด"),
    FoodMenu("ขนมจีบ", "35", "assets/images/m17.jpg", "นึ่ง"),
    FoodMenu("ปลานึ่งมะนาว", "150", "assets/images/m18.jpg", "นึ่ง"),
    FoodMenu("ไส้กรอกทอด", "40", "assets/images/m19.jpg", "ทอด"),
    FoodMenu("พิซซ่า", "199", "assets/images/m20.jpg", "อบ"),
  ];

  int totalCount = 0;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          FoodMenu food = menu[index];

          return ListTile(
            leading: Image.asset(
              food.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              food.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "ประเภท: ${food.type} | ราคา ${food.price} บาท",
            ),
            onTap: () {
              setState(() {
                totalCount++;
                totalPrice += int.parse(food.price);
              });

              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนู: ${food.name}"),
                content: Text(
                  "คุณเลือกทั้งหมด $totalCount จาน\n"
                  "ราคารวม $totalPrice บาท",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("ตกลง"),
                  ),
                ],
              );

              showDialog(
                context: context,
                builder: (context) => alert,
              );
            },
          );
        },
      ),
    );
  }
}
