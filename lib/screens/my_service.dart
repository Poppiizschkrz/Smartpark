// import 'dart:html';
// import 'dart:ffi';
import 'dart:io';
// import 'dart:js_util';

import 'package:Smartpark/screens/authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  Map<dynamic, dynamic> iotmap;
  int fanInt;
  String fanString = 'Stop fan';
  String temp_inside = 'https://github.com/Poppiizschkrz/Smartpark';
  WebController webController;
  String nameLogin = "", uidString;
  FirebaseAuth firebaseAuthMyService = FirebaseAuth.instance;

  void onWebCreatedTempInside(webController) {
    this.webController = webController;
    this.webController.loadUrl(temp_inside);
    this.webController.onPageStarted.listen((url) => print('Loading.. $url'));
    this
        .webController
        .onPageFinished
        .listen((url) => print('Finished Loading $url'));
  }

  @override
  void initState() {
    super.initState();
    getValueFromFirebase();
  }

  void getValueFromFirebase() async {
    DatabaseReference databaseReference =
        await firebaseDatabase.reference().once().then((objValue) {
      iotmap = objValue.value;
      setState(() {
        fanInt = iotmap['fan'];
        print('fan = $fanInt');
      });
    });
  }

  void editFirebase(String nodeString, int value) async {
    print('node ==> $nodeString');
    iotmap['$nodeString'] = value;
    await firebaseDatabase.reference().set(iotmap).then((objValue) {
      print('$nodeString success');
      getValueFromFirebase();
    }).catchError((objValue) {
      String error = objValue.message;
      print('error ==> $error');
    });
  }

  Widget button() {
    return Container(
      margin: EdgeInsets.only(top: 500),
      alignment: Alignment.center,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.pink[300],
          textColor: Colors.white,
          child: Text(fanString),
          onPressed: () {
            if (fanInt == 1) {
              fanString = 'Stop Fan';
              editFirebase('fan', 0);
            } else {
              fanString = 'Open Fan';
              editFirebase('fan', 1);
            }
          }),
    );
  }

  // Widget buttonlogout() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 500),
  //     alignment: Alignment.center,
  //     child: RaisedButton(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30.0),
  //         ),
  //         color: Colors.pink[300],
  //         textColor: Colors.white,
  //         child: Text(fanString),
  //         onPressed: () {
  //         }),
  //   );
  // }
  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: "sing Out",
      onPressed: () {
        signOut2();
      },
    );
  }

  void signOut() async {
    await firebaseAuthMyService.signOut().then((objValue) {
      print('Exit');
      exit(0);
    });
  }

  Future<void> signOut2() async {
    await firebaseAuthMyService.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) {
        return Authen();
      });
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
          (Route<dynamic> route) {
        return false;
      });
    });
  }

  Widget build(BuildContext context) {
    FlutterNativeWeb flutterNativeWebTempInside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedTempInside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Welcome To SmartParking'),
        actions: [
          signOutButton(),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(0, -1),
                colors: [
                  Colors.white,
                  Colors.pink[100],
                ],
                radius: 1.5),
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  button(),
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: flutterNativeWebTempInside,
                    height: 300.0,
                    width: 500.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
