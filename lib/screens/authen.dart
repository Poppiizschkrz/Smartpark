import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // ประกาศตัวแปร
  double amount = 150.0;
  double size = 250.0;

  Widget showLogo() {
    return Container(
      width: amount,
      height: amount,
      child: Image.asset(
        "images/iconfinder.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showAppName() {
    return Container(
      child: Text(
        'SmartParking',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.pink[200],
          fontWeight: FontWeight.bold,
          fontFamily: "Opun-Regular",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment(0, -1),
        padding: EdgeInsets.only(top: 70.0),
        child: Column(
          children: <Widget>[
            //Text('MY AUTHEN'),
            showLogo(),
            showAppName(),
          ],
        ),
      ),
    );
  }
}
