import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState(); //store email pass
}

class _AuthenState extends State<Authen> {
  // ประกาศตัวแปร
  double amount = 150.0;
  double size = 250.0;
  String emailString, passwordString;
  final formkey = GlobalKey<FormState>();

  bool checkSpace(String value) {
    // check mail pass
    bool result = false;
    if (value.length == 0) {
      // havespace
      result = true;
    }
    return result;
  }

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
              color: Colors.pink[300],
            ),
            hintText: 'abcde@email.com'),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Please Tyoe in Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget signInButton(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.pink[200],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('Your click login');
          formkey.currentState.save();
          print('Email=$emailString,password=$passwordString');
        },
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.pink[200]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.red[200]),
        ),
        onPressed: () {},
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
            color: Colors.pink[300],
          ),
          hintText: 'More 6 Charactor',
        ),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Password empty';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
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
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showAppName(),
              emailTextFormFeild(),
              passwordText(),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                width: size,
                child: Row(
                  children: <Widget>[
                    signInButton(context),
                    signUpButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
