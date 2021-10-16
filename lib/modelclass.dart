import 'dart:convert';
import 'package:apibottomnavigation/one_go.dart';
import 'package:flutter/material.dart';

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

