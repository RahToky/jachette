import 'package:bluekango/ui/screen/commands/command_detail_screen.dart';
import 'package:bluekango/ui/screen/home/home_screen.dart';
import 'package:bluekango/ui/screen/addresses/address_list_screen.dart';
import 'package:bluekango/ui/screen/cards/card_list_screen.dart';
import 'package:bluekango/ui/screen/commands/command_list_screen.dart';
import 'package:bluekango/ui/test/test_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon app test',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey, //change your color here
            ),
          )),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CommandListScreen.routeName: (context) => CommandListScreen(),
        CommandDetailScreen.routeName: (context) => CommandDetailScreen(),
        CardListScreen.routeName:(context)=> CardListScreen(),
        AddressListScreen.routeName:(context)=> AddressListScreen(),
      },
    );
  }
}
