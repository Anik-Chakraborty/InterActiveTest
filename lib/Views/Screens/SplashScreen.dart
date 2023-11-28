import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Views/Screens/DashboardScreen.dart';
import 'package:it_grow_test/Views/Screens/LogInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkUserLoginState().then((bool isLogin) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (isLogin) {
            //Navigate to home screen
            Get.offAll(DashboardScreen());
          } else {
            //Navigate to login screen
            Get.offAll(() => LogInScreen());
          }
        },
      );
    });
  }

  Future<bool> checkUserLoginState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.asset('assets/images/app_logo.png')),
      ),
    );
  }
}
