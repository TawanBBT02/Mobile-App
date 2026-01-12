import 'package:flutter/material.dart';

import 'dart:ui';
import 'shopping.dart';
import 'myRadioButton.dart';

//enum ProductTypeEnum { Downloadable, Deliverable }

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  var _productName;
  var _productDes;

  final _productController = TextEditingController();
  final _productDesController = TextEditingController();

  var _selectedChoice;

  bool? _checkbox, _listTileCheckBox = false;

  ProductTypeEnum? _productTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PRODUCT")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("PRODUCT App", style: TextStyle(fontSize: 30)),
            Text("Add Product detail in the form"),
            SizedBox(height: 10),
            MyTextField(
              fieldName: "Product Name",
              myController: _productController,
              myIcon: Icons.pin_drop_sharp,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 20),
            MyTextField(
              fieldName: "Product Description",
              myController: _productDesController,
              myIcon: Icons.pin_drop_sharp,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 20),

            //
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.deepPurple,
              tristate: true,
              value: _checkbox,
              onChanged: (val) {
                setState(() {
                  _checkbox = val;
                });
              },
            ),

            //
            CheckboxListTile(
              value: _listTileCheckBox,
              title: Text("Top Product"),
              onChanged: (val) {
                setState(() {
                  _listTileCheckBox = val;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            //Radio(value: null, groupValue: null, onChanged: null),
            //RadioListTile(value: null, groupValue: null, onChanged: null),

            //create radio Button
            ListTile(
              title: Text("1"),
              leading: Radio(
                value: 1,
                groupValue: _selectedChoice,
                onChanged: (value) {
                  setState(() {
                    _selectedChoice = 1;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("2"),
              leading: Radio(
                value: 2,
                groupValue: _selectedChoice,
                onChanged: (value) {
                  setState(() {
                    _selectedChoice = 2;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("3"),
              leading: Radio(
                value: 3,
                groupValue: _selectedChoice,
                onChanged: (value) {
                  setState(() {
                    _selectedChoice = 3;
                  });
                },
              ),
            ),
            //1Create radioListTile Button
            MyRadioButton(
              title: ProductTypeEnum.Deliverable.name,
              value: ProductTypeEnum.Deliverable,
              selectedProductType: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
            ),
            RadioListTile<ProductTypeEnum>(
              title: Text(ProductTypeEnum.Downloadable.name),
              value: ProductTypeEnum.Downloadable,
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
            ),
            SizedBox(height: 20),
            myBTN(context),
            SizedBox(height: 40),
          ],
        ),
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
              return formShopping(productName: "", productDes: "");
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        fixedSize: Size(300, 80),
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        elevation: 15,
        shadowColor: Colors.yellow,
        side: BorderSide(color: Colors.black87, width: 2),
        shape: StadiumBorder(),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
