import 'package:apibottomnavigation/one_go.dart';
import 'package:flutter/material.dart';

class AttendanceOne extends StatefulWidget {
  const AttendanceOne({Key key}) : super(key: key);

  @override
  _AttendanceOneState createState() => _AttendanceOneState();
}

class _AttendanceOneState extends State<AttendanceOne> {
  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Album>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.inTime);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Text("no data");
        },
      ),
    );
  }
}
