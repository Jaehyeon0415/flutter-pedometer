import 'package:flutter/services.dart';
import 'package:flutter_pedometer/pedometer_permission_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pedometer/flutter_pedometer_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterPedometer platform = MethodChannelFlutterPedometer();
  const MethodChannel channel = MethodChannel('flutter_pedometer');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return true;
      },
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return PedometerPermissionStatus.granted;
      },
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 999;
      },
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 123;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('isStepAvailable', () async {
    expect(await platform.isStepAvailable(), true);
  });

  test('getPermissionStatus', () async {
    expect(await platform.getPermissionStatus(), PedometerPermissionStatus.granted);
  });

  test('getTodayStep', () async {
    expect(await platform.getTodayStep(), 123);
  });

  test('getStep', () async {
    final DateTime to = DateTime.now();
    final DateTime from = DateTime(to.year, to.month, to.day);

    expect(await platform.getStep(from: from, to: to), 999);
  });
}
