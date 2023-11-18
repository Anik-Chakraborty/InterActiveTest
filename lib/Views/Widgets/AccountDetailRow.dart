import 'package:flutter/material.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';

Widget AccountDetailRow(String label, String value) {
  return Row(
    children: [
      Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: TxtStyle(20, black, FontWeight.w500)),
          )),
      Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value, style: TxtStyle(20, black, FontWeight.w500)),
          )),
    ],
  );
}
