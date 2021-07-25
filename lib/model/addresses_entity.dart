import 'package:bluekango/model/entity.dart';
import 'package:bluekango/model/listable_entity.dart';
import 'package:flutter/cupertino.dart';

class Address extends ListableEntity{

  static String tableName = 'Address';

  int id;
  String street;
  String address;

  Address({this.id,this.street,@required this.address});

  @override
  List<String> getDetails()=> [street,address];

  @override
  String getTitle() => '$id adresse';

  factory Address.fromMap(Map<String, dynamic> map) {
      return Address(id:map['id'],street:map['street'],address:map['address']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id':this.id,
      'street':this.street,
      'address':this.address,
    };
  }

}