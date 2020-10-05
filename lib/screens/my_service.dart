import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  Widget button() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.pink[300],
        textColor: Colors.white,
        child: Text('Button'),
        onPressed: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to SmartParking'),
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
            children: [button()],
          ),
        ),
      ),
    );
  }
}
