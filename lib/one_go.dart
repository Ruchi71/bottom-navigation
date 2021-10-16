import 'dart:async';
import 'dart:convert';

import 'package:apibottomnavigation/attendance_one_go.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String emp_id) async {
  final response = await http.post(
    Uri.parse(''),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'emp_id': emp_id,
    }),
  );
  if (response.statusCode == 200) {

    return Album.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to create album.');
  }
}

class Album {
  String inTime;
  String type;
  String totalTime;

  Album({
    this.inTime,
    this.type,
    this.totalTime,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      inTime: json["in_time"],
      type: json["type"],
      totalTime: json["total_time"],
    );
  }
}

class OneGo extends StatefulWidget {
  const OneGo({Key key}) : super(key: key);

  @override
  _OneGoState createState() => _OneGoState();
}

class _OneGoState extends State<OneGo> {
  @override
  Widget build(BuildContext context) {
    Future<Album> _futureAlbum;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("home")),
      bottomNavigationBar: CurvedNavigationBar(
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
              onPressed: (){
                setState(() {
                  _futureAlbum = createAlbum("45");
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) =>
                        AttendanceOne()));
              },
              icon: Icon(
                Icons.access_time_rounded,
                size: 20,
                color: Colors.white,
              )),
        ],

      ),
    );
  }
}



