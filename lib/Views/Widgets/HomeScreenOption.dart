import 'package:flutter/material.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';

HomeScreenOption(IconData icon, String title, Color bg) {
  return Container(
    margin: const EdgeInsets.all(30),
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: white, size: 80),
        SizedBox(
          height: 20,
        ),
        Text(title, style: TxtStyle(20, white, FontWeight.w500)),
      ],
    ),
  );
}
