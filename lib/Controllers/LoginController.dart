import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Data/Database/SQLHelper.dart';
import 'package:it_grow_test/Views/Screens/DashboardScreen.dart';
import 'package:it_grow_test/Views/Screens/LogInScreen.dart';
import 'package:it_grow_test/Views/Widgets/LoadingDialog.dart';
import 'package:it_grow_test/Views/Widgets/ShowSnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:it_grow_test/Resources/Colors.dart';

FirebaseAuth auth = FirebaseAuth.instance;

loginUser(BuildContext context, String email, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    prefs.setBool('isLogin', true);
    ShowSnackBar(context, 'Login Successful', green);
    Get.offAll(() => DashboardScreen());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.back();
      ShowSnackBar(context, 'No user found with this email', red);
    } else if (e.code == 'wrong-password') {
      Get.back();
      ShowSnackBar(context, 'Wrong Password', red);
    } else {
      Get.back();
      ShowSnackBar(context, e.code, red);
    }
  }
}

registerUser(BuildContext context, String email, String password) async {
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    ShowSnackBar(context, 'Register Successful', green);
    Get.offAll(() => LogInScreen());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.back();
      ShowSnackBar(context, 'Weak password', red);
    } else if (e.code == 'email-already-in-use') {
      Get.back();
      ShowSnackBar(
          context, 'An account exits with the given email address.', red);
    } else if (e.code == 'invalid-email') {
      Get.back();
      ShowSnackBar(context, 'Email Address is not valid.', red);
    } else {
      Get.back();
      ShowSnackBar(context, e.toString(), red);
    }
  }
}

logOutUser(BuildContext context) async {
  LoadingDialog(context);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  auth.signOut();
  await SQLHelper.delete();
  prefs.setBool('isLogin', false);
  Get.offAll(() => LogInScreen());
  ShowSnackBar(context, 'Log out Successful', green);
}
