import 'package:flutter/material.dart';

class formShopping extends StatelessWidget {
  const formShopping({
    super.key,
    required this.productName,
    required this.customerName,
  });

  final String productName;
  final String customerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Form")),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text("Product Name: $productName"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Customer Name: $customerName"),
            ),
          ],
        ),
      ),
    );
  }
}
