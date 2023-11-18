import 'package:flutter/material.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';

ShowSnackBar(BuildContext context, String msg, Color bgColor) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: bgColor,
    padding: const EdgeInsets.all(10),
    content: Text(msg, style: TxtStyle(20, white, FontWeight.w500)),
  ));
}
