import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> PostRequest(String URL, Map data) async {
  try {
    String body = json.encode(data);
    http.Response response = await http.post(
      Uri.parse('$URL'),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return ['Completed', response];
  } catch (error) {
    debugPrint('unauthorized');
    return ['Error', []];
  }
}
