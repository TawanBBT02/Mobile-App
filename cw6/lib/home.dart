import 'package:flutter/material.dart';
import 'inputForm.dart';
import 'shopping.dart';

class myHome extends StatelessWidget {
  const myHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Home")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  myBTN(context),

                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return myForm();
                          },
                        ),
                      );
                    },
                    child: Text("Input Form"),
                    style: OutlinedButton.styleFrom(fixedSize: Size(300, 80)),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text("Text Button"),
                    style: TextButton.styleFrom(fixedSize: Size(300, 80)),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton myBTN(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Let's Begin"), Icon(Icons.add_shopping_cart_outlined)],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return formShopping(productName: "", customerName: "");
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8.0),
        fixedSize: Size(300, 80),
        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        elevation: 15,
        shadowColor: Colors.yellow,
        side: BorderSide(color: Colors.black87, width: 2),
      ),
    );
  }
}
