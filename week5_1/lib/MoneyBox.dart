import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Moneybox extends StatelessWidget {
  String title = "";
  double amount = 0.0;
  double sizeConHight;
  double borderRadius;
  Color colorSet;

  Moneybox(
    this.title,
    this.amount,
    this.sizeConHight,
    this.borderRadius,
    this.colorSet,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorSet,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: sizeConHight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###,###.##").format(amount)}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
