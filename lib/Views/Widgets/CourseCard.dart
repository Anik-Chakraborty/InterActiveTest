import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Screens/CourseScreen.dart';

CourseCard(Map course, Color bg, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width * 0.8,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                flex: 1,
                child: Icon(FontAwesomeIcons.graduationCap,
                    color: white, size: 50)),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Course Name: ${course['courseName']}',
                      style: TxtStyle(20, white, FontWeight.w700)),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Course Description: ${course['courseDes']}',
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.fade,
              style: TxtStyle(15, white, FontWeight.w500)),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(() => CourseScreen(
                  course: course,
                ));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(black)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Continue', style: TxtStyle(20, white, FontWeight.w700))
              ],
            ),
          ),
        )
      ],
    ),
  );
}
