
import 'package:apibottomnavigation/api_class.dart';
import 'package:apibottomnavigation/attendance.dart';
import 'package:apibottomnavigation/home.dart';
import 'package:apibottomnavigation/modelclass.dart';
import 'package:apibottomnavigation/provider_class.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BottoNavigation extends StatefulWidget {
  const BottoNavigation({Key key}) : super(key: key);

  @override
  _BottoNavigationState createState() => _BottoNavigationState();
}

class _BottoNavigationState extends State<BottoNavigation> {

  /*SharedPreferences logindata;
  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initial();
    super.initState();
  }*/
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        body: Consumer<MyModel>(
            builder: (context, myModel, child) {

              return
                Center(child: Text("home"));

            }),
        bottomNavigationBar: Consumer<MyModel>(
            builder: (context, myModel, child) {
              return CurvedNavigationBar(
                color: Colors.blue[900],
                backgroundColor: Colors.white,
                buttonBackgroundColor: Colors.blue[900],
                height: 70,
                animationDuration: Duration(
                  milliseconds: 200,
                ),
                animationCurve: Curves.bounceInOut,
                items: [
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.white,
                      )),
                  IconButton(
                    onPressed: ()async{
                      await myModel.lastdata();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) =>
                              Attendance()));
                    },
                      icon: Icon(
                        Icons.access_time_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                ],

              );}
        ),
      ),
    );
  }
}

