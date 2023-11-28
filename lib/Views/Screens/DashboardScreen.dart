import 'package:flutter/material.dart';
import 'package:it_grow_test/Controllers/LoginController.dart';
import 'package:it_grow_test/Data/CourseData.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Widgets/CourseCard.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard', style: TxtStyle(20, white, FontWeight.w500)),
        backgroundColor: logoColor,
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: white,
              ),
            ),
            onPressed: () => logOutUser(context),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemBuilder: (context, index) {
              Color bgColor = ((courseDetails.length)%(index+1)==0)?skyBlue: ((courseDetails.length)%(index+1)==1)? yellow : ((courseDetails.length)%(index+1)==2)? green : red;
          return CourseCard(
              courseDetails[index], bgColor,context);
        },itemCount: courseDetails.length),
      ),
    );
  }
}
