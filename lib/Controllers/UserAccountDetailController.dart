import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:it_grow_test/Data/Networks/PostRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> fetchUserAccountDetail(BuildContext context) async {
  var jsonData;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String GetAccountInformation = dotenv.get("GetAccountInformation");
  String GetLastFourNumbersPhone = dotenv.get("GetLastFourNumbersPhone");

  Map<String, dynamic> data = {
    "login": prefs.getString('login'),
    "token": prefs.getString('token')
  };

  List resultDetails = await PostRequest(GetAccountInformation, data);
  if (resultDetails[0] == 'Completed') {
    http.Response response = resultDetails[1];
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
    } else {
      debugPrint('access denied');
      return {'result': 'Access Denied'};
    }
  } else {
    debugPrint('Error');
    return {'result': 'Error'};
  }

  List resultPhone = await PostRequest(GetLastFourNumbersPhone, data);

  if (resultPhone[0] == 'Completed') {
    http.Response response = resultPhone[1];
    if (response.statusCode == 200) {
      jsonData['phoneNo'] = response.body;
    } else {

      debugPrint('access denied');
      return {'result': 'Access Denied'};
    }
  } else {
    debugPrint('Error');
    return {'result': 'Error'};
  }
  jsonData['result'] = 'Complete';
  return jsonData;
}
