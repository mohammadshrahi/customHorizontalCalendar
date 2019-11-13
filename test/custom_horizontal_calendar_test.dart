import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';

void main() {
  const MethodChannel channel = MethodChannel('custom_horizontal_calendar');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
