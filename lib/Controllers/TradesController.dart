import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Data/Networks/PostRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TradesController extends GetxController{
  RxDouble totalProfit = 0.0.obs;

  Future fetchTradesData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String GetOpenTrades = dotenv.get("GetOpenTrades");

    Map<String, dynamic> data = {
      "login": prefs.getString('login'),
      "token": prefs.getString('token')
    };

    List resultDetails = await PostRequest(GetOpenTrades, data);
    if (resultDetails[0] == 'Completed') {
      http.Response response = resultDetails[1];
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for(var json in jsonData){
          totalProfit.value += json['profit'];
        }
         return  {
           'result' : 'Complete',
           'data' : jsonData
         };
      } else {
        debugPrint('access denied');
        return {
          'result' : 'Access Denied'
        };
      }
    } else {
      debugPrint('Error');
      return {'result': 'Error'};
    }

  }

}