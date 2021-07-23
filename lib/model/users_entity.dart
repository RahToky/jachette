import 'package:flutter/cupertino.dart';

class User{

  static String tableName = 'User';
  int id;
  String name;
  String photo;

  User({this.id,@required this.name,this.photo});

  @override
  factory User.fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

}