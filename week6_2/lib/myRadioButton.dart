import 'package:flutter/material.dart';

import 'form.dart';

enum ProductTypeEnum { Downloadable, Deliverable }

class MyRadioButton extends StatelessWidget {
  MyRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedProductType,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final ProductTypeEnum value;
  final ProductTypeEnum selectedProductType;
  final Function(ProductTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<ProductTypeEnum>(
        title: Text(title),
        value: value,
        groupValue: selectedProductType,
        dense: true,
        contentPadding: EdgeInsets.all(0),
        onChanged: onChanged,
      ),
    );
  }
}
