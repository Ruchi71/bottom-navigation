import 'package:apibottomnavigation/api_class.dart';
import 'package:apibottomnavigation/attendance.dart';
import 'package:apibottomnavigation/attendance_button.dart';
import 'package:apibottomnavigation/home.dart';
import 'package:apibottomnavigation/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyModel with ChangeNotifier {

  LastModel lastModel;
  int currentindex = 0;


  final screens = [Home(),Attendance()];
  void doSomething(index) {
    currentindex = index;
    notifyListeners();
  }
  void lastdata()async{
    final LastModel lastd = await lastUser();
    lastModel = lastd;
    notifyListeners();
  }

}