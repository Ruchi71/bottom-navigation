
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

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        body: Consumer<MyModel>(
            builder: (context, myModel, child) {
              return myModel.screens[myModel.currentindex];
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
                index: myModel.currentindex,
                items: [
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.white,
                      )),
                  IconButton(
                      icon: Icon(
                        Icons.access_time_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                ],
                onTap: (index) async {
                  await myModel.doSomething(index);
                 // await myModel.lastdata();

                 /* if (index == 1){
                   await myModel.lastdata();
                  }*/
                },
              );}
        ),
      ),
    );
  }
}

