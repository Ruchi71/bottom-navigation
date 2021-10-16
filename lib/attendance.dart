import 'package:apibottomnavigation/bottomnavigation.dart';
import 'package:apibottomnavigation/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Attendance extends StatefulWidget {
  const Attendance({Key key}) : super(key: key);


  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool last = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ChangeNotifierProvider<MyModel>(
          create: (context) => MyModel(),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 30,),
              Text("Attendance"),
             /* Consumer<MyModel>(builder: (context, myModel, child) {
                return ElevatedButton(
                    onPressed: ()async{
                      await myModel.lastdata();
                    },
                    child: Text("submit"));
              }),*/
              Consumer<MyModel>(
                  builder: (context, myModel, child) {
    if(!last){
                     myModel.lastdata();
    last = true;
    }

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
