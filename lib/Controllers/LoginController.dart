import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:it_grow_test/Data/Networks/PostRequest.dart';
import 'package:it_grow_test/Views/Screens/HomeScreen.dart';
import 'package:it_grow_test/Views/Screens/LogInScreen.dart';
import 'package:it_grow_test/Views/Widgets/LoadingDialog.dart';
import 'package:it_grow_test/Views/Widgets/ShowSnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:it_grow_test/Resources/Colors.dart';

loginUser(BuildContext context, String loginCode, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String IsAccountCredentialsCorrect =
      dotenv.get("IsAccountCredentialsCorrect");

  Map<String, dynamic> data = {"login": loginCode, "password": password};

  List result = await PostRequest(IsAccountCredentialsCorrect, data);

  if (result[0] == 'Completed') {
    http.Response response = result[1];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData['result'] == true) {
        prefs.setString('token', jsonData['token']);
        prefs.setString('login', loginCode.toString());
        prefs.setBool('isLogin', true);
        ShowSnackBar(context, 'Login Successful', green);
        Get.offAll(() => HomeScreen());
      } else {
        debugPrint('result false');
        ShowSnackBar(context, 'Wrong Credentials', red);
        Get.back();
      }
    } else {
      debugPrint('unauthorized');
      ShowSnackBar(context, 'Wrong Credentials', red);
      Get.back();
    }
  } else {
    debugPrint('Error');
    ShowSnackBar(context, 'Check Internet Connection', red);
    Get.back();
  }
}

logOutUser(BuildContext context) async {
  LoadingDialog(context);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', '');
  prefs.setString('login', '');
  prefs.setBool('isLogin', false);
  Get.offAll(() => LogInScreen());
  ShowSnackBar(context, 'Log out Successful', green);
}
