import 'package:flutter/cupertino.dart';

class User{

  static String tableName = 'User';
  int id;
  String name;
  String photo;

  User({this.id,@required this.name,this.photo});

  @override
  factory User.fromMap(Map<String, dynamic> map) {
    return User(id:map['id'],name:map['name'],photo:map['photo']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'name':this.name,
      'photo':this.photo,
    };
  }

}