import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';

CourseCompleteDialog(Map course) {
  return Get.dialog(Dialog(
    backgroundColor: green,
    shadowColor: transparent,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.certificate,
              color: white,
              size: 50,
            ),
          ),
          Text('Congratulation', style: TxtStyle(20, white, FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          Text('You have completed',
              style: TxtStyle(20, white, FontWeight.w500)),
          const SizedBox(
            height: 20,
          ),
          Text(course['courseName'],
              textAlign: TextAlign.center,
              style: TxtStyle(20, white, FontWeight.w700))
        ],
      ),
    ),
  ));
}
