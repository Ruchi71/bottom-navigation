import 'package:apibottomnavigation/modelclass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<LastModel> lastUser() async {
  final String apiUrl =
      "";

  final response =
  await http.post(Uri.parse(apiUrl), body: jsonEncode({"emp_id": "45"}));

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print('responnse status:${response.statusCode}');
    print('response body: ${responseString}');

    return lastModelFromJson(responseString);
  } else {
    return null;
  }
}
