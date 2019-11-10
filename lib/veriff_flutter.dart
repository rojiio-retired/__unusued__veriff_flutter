import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';

///
/// Confirgures 
///
class VeriffFlutterConfig {

  final String sessionToken;
  String color;

  VeriffFlutterConfig(this.sessionToken, {this.color});


  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['sessionToken'] = sessionToken;
    map['color']    = color;
    return map;
  }
}


// extends StatelessWidget

class VeriffFlutter  {
  static const MethodChannel _channel = const MethodChannel('roji.io/veriff_flutter');

  static Future startAuthentication(VeriffFlutterConfig config) async {

    await _channel.invokeMethod('startAuthentication', config.toMap());
  }
}
