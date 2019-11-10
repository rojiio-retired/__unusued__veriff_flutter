import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:veriff_flutter/veriff_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.roji.io/veriff_flutter');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
