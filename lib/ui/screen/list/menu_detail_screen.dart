import 'package:flutter/material.dart';

class MenuDetailScreen extends StatelessWidget {

  static final String routeName = "/commands";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: Text('Titre'),
            )
          ],
        ),
      ),
    );
  }
}
