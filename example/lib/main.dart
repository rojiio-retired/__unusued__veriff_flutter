import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:veriff_flutter/veriff_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> startAuthentication() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      var config = VeriffFlutterConfig("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiZTNjN2MzMzQtN2Q5Ni00NGZjLWEzYTgtYTNmYTM0NDZmYjliIiwiaWF0IjoxNTczMTEwMjA4fQ.DzT2dVNVDX_6xkrDowqq8ry5tfK_0RsBE7v4Q_CyiO8",
                  color: "340000");

      await VeriffFlutter.startAuthentication(config);
    } on PlatformException {
      print('Failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(child: Text('Start Verification'), onPressed: () {
            startAuthentication();
          },),
        ),
      ),
    );
  }
}
