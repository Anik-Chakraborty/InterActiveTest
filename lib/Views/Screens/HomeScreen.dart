import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/LoginController.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Screens/TradesScreen.dart';
import 'package:it_grow_test/Views/Screens/UserAccountScreen.dart';
import 'package:it_grow_test/Views/Widgets/HomeScreenOption.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen', style: TxtStyle(20, white, FontWeight.w500)),
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
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => UserAccountScreen());
                  },
                  child: HomeScreenOption(
                      Icons.account_circle, 'User Account', yellow)),
              InkWell(
                  onTap: () {
                    Get.to(() => TradesScreen());
                  },
                  child: HomeScreenOption(Icons.analytics, 'Trades', skyBlue)),
            ],
          ),
        ),
      ),
    );
  }
}
