import 'package:bluekango/ui/screen/detail/command_detail_screen.dart';
import 'package:bluekango/ui/screen/home/home_screen.dart';
import 'package:bluekango/ui/screen/list/menu_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        MenuListScreen.routeName: (context) => MenuListScreen(),
        CommandDetailScreen.routeName: (context) => CommandDetailScreen(),
      },
    );
  }
}
