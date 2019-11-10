import 'dart:async';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

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

class VeriffFlutterStatus {

}


// extends StatelessWidget

class VeriffFlutter  {

  /// Constructs a singleton instance of [VeriffFlutter].
  ///
  /// [VeriffFlutter] is designed to work as a singleton.
  // When a second instance is created, the first instance will not be able to listen to the
  // EventChannel because it is overridden. Forcing the class to be a singleton class can prevent
  // misusage of creating a second instance from a programmer.
  factory VeriffFlutter() {
    if (_singleton == null) {
      _singleton = VeriffFlutter._();
    }
    return _singleton;
  }

  VeriffFlutter._();

  static VeriffFlutter _singleton;

  Stream<VeriffFlutterStatus> _onStatusChangedChanged;

  @visibleForTesting
  static const MethodChannel channel = const MethodChannel('plugins.roji.io/veriff_flutter');
  
  @visibleForTesting
  static const EventChannel eventChannel = EventChannel('plugins.roji.io/veriff_flutter_status');

  /// Fires whenever the connectivity state changes.
  Stream<VeriffFlutterStatus> get onStatusChanged {
    if (_onStatusChangedChanged == null) {
      _onStatusChangedChanged = eventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseVerifyFlutterStatus(event));
    }
    return _onStatusChangedChanged;
  }

  Future startAuthentication(VeriffFlutterConfig config) async {
    await channel.invokeMethod('startAuthentication', config.toMap());
  }

  VeriffFlutterStatus _parseVerifyFlutterStatus(dynamic event) {
    return VeriffFlutterStatus();
  }
}
