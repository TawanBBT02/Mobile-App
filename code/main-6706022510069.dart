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
  int totalCount = 0;
  int totalPrice = 0;

  List<FoodMenu> menu = [
    FoodMenu(
        "กระเพราหมูสับไข่ต้มยางมะตอย", "999", "assets/images/m1.jpg", "ผัด"),
    FoodMenu("ผัดไทยกุ้งแห้ง", "55", "assets/images/m2.jpg", "ผัด"),
    FoodMenu("ชูชิปลานิล", "65", "assets/images/m3.jpg", "สด"),
    FoodMenu("BBQ อูฐ", "750", "assets/images/m4.jpg", "ย่าง"),
    FoodMenu("ซาลาเปา ไส้ตัน", "50", "assets/images/m5.jpg", "นึ่ง"),
    FoodMenu("กุ้งพ่อน้ำเผา", "900", "assets/images/m6.jpg", "เผา"),
    FoodMenu("แกงจืดไประ", "70", "assets/images/m7.jpg", "ต้ม"),
    FoodMenu("ปลาบลูฟินทอดน้ำปลา", "6900", "assets/images/m8.jpg", "ทอด"),
    FoodMenu("แหนมอำเภอ", "200", "assets/images/m9.jpg", "สด"),
    FoodMenu("เบอร์เกอร์ King", "99", "assets/images/m10.jpg", "ทอด"),
    FoodMenu("ส้มตำปลาร้าค้างคืน", "40", "assets/images/m11.jpg", "ตำ"),
    FoodMenu("ไก่ย่างถ่านหิน", "120", "assets/images/m12.jpg", "ย่าง"),
    FoodMenu("ข้าวต้มมัดตราหมา", "20", "assets/images/m13.jpg", "ต้ม"),
    FoodMenu("ไข่เจียวฟูจิ", "80", "assets/images/m14.jpg", "ทอด"),
    FoodMenu("หมูมะนาวต่างด้าว", "150", "assets/images/m15.jpg", "ยำ"),
    FoodMenu("กุ้งแช่น้ำปลาทิพย์", "180", "assets/images/m16.jpg", "สด"),
    FoodMenu("คอหมูย่างเกลือแร่", "100", "assets/images/m17.jpg", "ย่าง"),
    FoodMenu("ต้มยำกุ้งมังกร", "1500", "assets/images/m18.jpg", "ต้ม"),
    FoodMenu("ปลากะพงนึ่งสองสามสี่", "350", "assets/images/m19.jpg", "นึ่ง"),
    FoodMenu("ไก่ทอดหาดใหญ่มาก", "65", "assets/images/m20.jpg", "ทอด"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          FoodMenu food = menu[index];

          return ListTile(
            leading: Image.asset(food.img, width: 50),
            title: Text(
              food.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("ประเภท: ${food.type} | ราคา ${food.price} บาท"),
            onTap: () {
              setState(() {
                totalCount++;
                totalPrice += int.parse(food.price);
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("คุณเลือกเมนู คือ ${food.name}"),
                    content: Text(
                        "คุณเลือกไปทั้งหมด: $totalCount จาน\nราคารวมเป็นเงิน: ${totalPrice.toStringAsFixed(2)} บาท"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("ตกลง"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
