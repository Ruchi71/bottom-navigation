
import 'package:apibottomnavigation/bottomnavigation.dart';
import 'package:apibottomnavigation/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ChangeNotifierProvider<MyModel>(
            create: (context) => MyModel(),
            child: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Consumer<MyModel>(builder: (context, myModel, child) {
                      return TextField(
                          controller: myModel.nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                          ));
                    }),
                    SizedBox(height: 30,),
                    Consumer<MyModel>(builder: (context, myModel, child) {
                      return TextField(
                          controller: myModel.passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                          ));
                    }),
                    Consumer<MyModel>(builder: (context, myModel, child) {
                      return ElevatedButton(
                          onPressed: () async {
                            await myModel.getdata();
                            final snackbarfail = SnackBar(content: Text("login failed"));
                            if(myModel._model.status == true){
                              await myModel.lastdata();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) =>
                                      BottomNavigation()));
                            } else{
                              Scaffold.of(context).showSnackBar(snackbarfail);
                            }
                           /* myModel._model.status == true?

                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) =>
                                    BottomNavigation()));

                                :Scaffold.of(context).showSnackBar(snackbarfail);*/
                          },
                          child:Text('Login')
                      );}),
                  ],
                ),
              );
            }))
    );
  }
}

class MyModel with ChangeNotifier {
  UserModel _model;
  LastModel lastModel;
  String username;
  String password;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void getdata() async {
    final String username = nameController.text;
    final String password = passwordController.text;

    final UserModel userdata = await createUser(username, password);

    _model = userdata;
    notifyListeners();
  }
  void lastdata()async{
    final LastModel lastd = await lastUser();
    lastModel = lastd;
    notifyListeners();
  }
}

Future<UserModel> createUser(String username, String password) async {
  final String apiUrl =
      "";

  final response = await http.post(Uri.parse(apiUrl),
      body: jsonEncode({"username": username, "password": password}));

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
  });

  bool status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

Future<LastModel> lastUser() async {
  final String apiUrl =
      "https://blueskyhrms.com/viola_demo/index.php?r=apiattendance/lastlog";

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

LastModel lastModelFromJson(String str) => LastModel.fromJson(json.decode(str));

String lastModelToJson(LastModel data) => json.encode(data.toJson());

class LastModel {
  LastModel({
    this.inTime,
    this.type,
    this.totalTime,
  });

  String inTime;
  String type;
  String totalTime;

  factory LastModel.fromJson(Map<String, dynamic> json) => LastModel(
    inTime: json["in_time"],
    type: json["type"],
    totalTime: json["total_time"],
  );

  Map<String, dynamic> toJson() => {
    "in_time": inTime,
    "type": type,
    "total_time": totalTime,
  };
}



