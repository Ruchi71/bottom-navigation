import 'package:apibottomnavigation/bottomnavigation.dart';
import 'package:apibottomnavigation/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AttendanceButton extends StatefulWidget {
  const AttendanceButton({Key key}) : super(key: key);


  @override
  _AttendanceButtonState createState() => _AttendanceButtonState();
}

class _AttendanceButtonState extends State<AttendanceButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MyModel>(
          create: (context) => MyModel(),
          child: Center(
              child: Column(
                children: [
                  Text("AttendanceButton"),
                   Consumer<MyModel>(builder: (context, myModel, child) {
                return ElevatedButton(
                    onPressed: ()async{
                      await myModel.lastdata();
                    },
                    child: Text("submit"));
              }),
                  Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return myModel.lastModel == null? Text("no data"):
                        Text("time ${myModel.lastModel.inTime}")
                        ;
                      }

                  ),
                  Text("time"),
                  Text("hour"),
                ],
              ))),
    );
  }
}
