import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/LoginController.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Screens/RegisterScreen.dart';
import 'package:it_grow_test/Views/Widgets/LoadingDialog.dart';
import 'package:it_grow_test/Views/Widgets/ShowSnackBar.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: null,
          backgroundColor: logoColor,
          centerTitle: true,
          title: Text(
            'Login',
            style: TxtStyle(20, white, FontWeight.w500),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewInsets.bottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset('assets/images/app_logo.png'))),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      'Email',
                      style: TxtStyle(20, black, FontWeight.w500),
                    ),
                  )
                ],
              ),
              //Login code text field
              Container(
                padding: const EdgeInsets.only(left: 10, top: 1, right: 7),
                color: white,
                child: TextFormField(
                  controller: email,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: grey,
                        fontSize: 2,
                        color: grey),
                    hintText: 'example@emaill.com',
                    contentPadding: EdgeInsets.only(left: 5),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: logoColor, width: 2)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      'Password',
                      style: TxtStyle(20, black, FontWeight.w500),
                    ),
                  )
                ],
              ),
              //password text field
              Container(
                padding: const EdgeInsets.only(left: 10, top: 1, right: 7),
                color: white,
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: grey,
                        fontSize: 2,
                        color: grey),
                    hintText: 'password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: logoColor, width: 2)),
                    contentPadding: EdgeInsets.only(left: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: logoColor,
                  ),
                  onPressed: () {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      LoadingDialog(context);
                      loginUser(context, email.text, password.text);
                    } else {
                      if (email.text.isEmpty) {
                        ShowSnackBar(context, 'Enter Email', red);
                      } else {
                        ShowSnackBar(context, 'Enter Password', red);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TxtStyle(20, white, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => RegisterScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TxtStyle(20, black, FontWeight.w500),
                    ),
                    Text(
                      'Register',
                      style: TxtStyle(20, logoColor, FontWeight.w700),
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
