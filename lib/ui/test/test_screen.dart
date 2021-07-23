import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static final String routeName = "/test";

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
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(50))
                ),
                alignment: Alignment.topRight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'O',
                    textScaleFactor: 20,
                    textAlign: TextAlign.right,
                    style: TextStyle(shadows: [
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Colors.blueGrey,
                      ),
                    ]),
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
                    borderRadius:  BorderRadius.only(topRight: Radius.circular(50))
                ),
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
