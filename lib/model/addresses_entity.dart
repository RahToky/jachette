import 'package:bluekango/model/listable_entity.dart';
import 'package:flutter/cupertino.dart';

class Address extends ListableEntity{

  int id;
  String street;
  String address;

  Address({@required this.id,this.street,@required this.address});

  @override
  List<String> getDetails()=> [street,address];

  @override
  String getTitle() => '$id adresse';

}