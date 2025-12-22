import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listview Widget',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Foodmenu> menu = [
    Foodmenu("กระเพราหมู", "50", "assets/images/m1.jpg", "ผัด"),
    Foodmenu("ผัดไทกุ้งสุก", "60", "assets/images/m2.jpg", "ผัด"),
    Foodmenu("ซูชิ", "500", "assets/images/m3.jpg", "ญี่ปุ่น"),
    Foodmenu("บาบิคิว", "120", "assets/images/m4.jpg", "ย่าง"),
    Foodmenu("ซาลาเปา", "15", "assets/images/m5.jpg", "นึ่ง"),
    Foodmenu("กุ้งเผา", "150", "assets/images/m6.jpg", "เผา"),
    Foodmenu("ต้มมะระ", "40", "assets/images/m7.jpg", "ต้ม"),
    Foodmenu("ปลาทอด", "45", "assets/images/m8.jpg", "ทอด"),
    Foodmenu("แหนมเนือง", "249", "assets/images/m9.jpg", "เวียดนาม"),
    Foodmenu("แฮมเบอร์เกอร์", "89", "assets/images/m10.jpg", "อเมริกัน"),

    Foodmenu("ต้มยำกุ้ง", "80", "assets/images/m11.jpg", "ต้ม"),
    Foodmenu("ทะเลดอง", "250", "assets/images/m12.jpg", "ดอง"),
    Foodmenu("ราเม็งขาจรเข้", "429", "assets/images/m13.jpg", "ไตหวัน"),
    Foodmenu("ต้มจืดหมู", "55", "assets/images/m14.jpg", "ต้ม"),
    Foodmenu("ไข่เจียวเจ๊ไฝ", "3500", "assets/images/m15.jpg", "ทอด"),
    Foodmenu("ผัดผักบุ้งไฟลอย", "120", "assets/images/m16.jpg", "ผัด"),
    Foodmenu("ข้าวหมูแดง", "60", "assets/images/m17.jpg", "ตามสั่ง"),
    Foodmenu("ต้มข่าไก่", "60", "assets/images/m18.jpg", "ต้ม"),
    Foodmenu("ห่อหมก", "80", "assets/images/m19.jpg", "นึ่ง"),
    Foodmenu("ผัดเผ็ดหมูป่า", "109", "assets/images/p1.png", "ผัด"),
  ];

  List<Widget> getData(int count) {
    List<Widget> data = [];
    data.add(
      Text(
        "กดปุ่มเพื่อเพิ่มค่าตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );
    for (int i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "Menu $i",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Text("sub-Menu $i"),
      );
      data.add(menu);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    int total_price = 0;
    int total_items = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Hello Flutter"),
      ),

      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          Foodmenu food = menu[index];
          return ListTile(
            leading: Image.asset(
              food.foodImage,
              width: 60,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              "เมนู ที่  ${index + 1}. " + food.foodName,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            subtitle: Text(
              food.foodName +
                  " ราคา " +
                  food.foodPrice +
                  " บาท \nประเภทอาหาร : " +
                  food.foodType,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            onTap: () {
              total_price += int.parse(food.foodPrice);
              total_items += 1;
              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนู " + food.foodName),
                content: Text(
                  "ราคา " +
                      food.foodPrice +
                      " บาท\n\n" +
                      "รวม " +
                      total_items.toString() +
                      " รายการ\n" +
                      "รวมเป็นเงิน " +
                      total_price.toString() +
                      " บาท",
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
