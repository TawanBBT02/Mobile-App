import 'package:flutter/material.dart';

class formShopping extends StatelessWidget {
  const formShopping({
    super.key,
    required this.productName,
    required this.productDes,
  });
  final String productName;
  final String productDes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text(productName),
              subtitle: Text(productDes),
            ),
          ],
        ),
      ),
    );
  }
}
