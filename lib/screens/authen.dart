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

  Widget emailTextFormFeild() {
    return Container(
      width: size,
      child: TextFormField(
        style: TextStyle(
          color: Colors.red[300],
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              size: 50.0,
              color: Colors.red[200],
            ),
            labelText: 'User',
            labelStyle: TextStyle(
              color: Colors.pink[500],
            ),
            hintText: 'abcde@email.com'),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true, //secure password
        style: TextStyle(
          color: Colors.red[300],
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 50.0,
            color: Colors.red[200],
          ),
          labelText: 'Password : ',
          labelStyle: TextStyle(
            color: Colors.pink[500],
          ),
          hintText: 'More 6 Charactor',
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
            emailTextFormFeild(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
