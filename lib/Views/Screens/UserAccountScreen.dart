import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/LoginController.dart';
import 'package:it_grow_test/Controllers/UserAccountDetailController.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Widgets/AccountDetailRow.dart';

class UserAccountScreen extends StatefulWidget {
  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          centerTitle: true,
          title: Text('Account Details',
              style: TxtStyle(20, white, FontWeight.w500)),
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
              onPressed: () {
                logOutUser(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: fetchUserAccountDetail(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var status = snapshot.data['result'];
                if (status == 'Error') {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Text('Something Went Wrong, Try Later',
                          style: TxtStyle(20, black, FontWeight.w500)),
                    ),
                  );
                } else if (status == 'Access Denied') {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Text('Access Denied, Login Again',
                          style: TxtStyle(20, black, FontWeight.w500)),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      AccountDetailRow('Name', snapshot.data['name']),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow(
                          'Balance', snapshot.data['balance'].toString()),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow('Address', snapshot.data['address']),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow('City', snapshot.data['city']),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow('Country', snapshot.data['country']),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow('ZipCode', snapshot.data['zipCode']),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            thickness: 2,
                            color: grey,
                          )),
                      AccountDetailRow('Phone No', snapshot.data['phoneNo']),
                    ],
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: grey,
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: white),
                      child: const CircularProgressIndicator(
                        backgroundColor: transparent,
                        color: logoColor,
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text('Something Went Wrong, Try Later',
                      style: TxtStyle(20, black, FontWeight.w500)),
                );
              }
            },
          ),
        ));
  }
}
