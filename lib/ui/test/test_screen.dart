import 'dart:async';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  static final String routeName = "/test";

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int stepIndex = 0;

  List<Widget> steps = [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Text(
        'First',
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    ),
    Container(
        width: 200,
        height: 200,
        color: Colors.yellow,
        child: Text('Second',
            style: TextStyle(color: Colors.white, fontSize: 22))),
    Container(
        width: 200,
        height: 200,
        color: Colors.green,
        child:
            Text('Third', style: TextStyle(color: Colors.white, fontSize: 22))),
  ];

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (stepIndex == steps.length - 1)
          stepIndex = 0;
        else
          stepIndex++;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                alignment: Alignment.topRight,
                child: Align(
                  alignment: Alignment.center,
                  child: IndexedStack(
                    index: stepIndex,
                    children: steps,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                child: Text(
                  'b',
                  textScaleFactor: 52,
                  style: TextStyle(shadows: [
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
