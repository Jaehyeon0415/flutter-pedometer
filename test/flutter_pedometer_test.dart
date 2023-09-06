import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_pedometer/pedometer_permission_status.dart';
import 'package:flutter_pedometer/flutter_pedometer_platform_interface.dart';
import 'package:flutter_pedometer/flutter_pedometer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPedometerPlatform with MockPlatformInterfaceMixin implements FlutterPedometerPlatform {
  
  @override
  Future<bool> isStepAvailable() {
    return Future.value(true);
  }

  @override
  Future<PedometerPermissionStatus> getPermissionStatus() {
    return Future.value(PedometerPermissionStatus.granted);
  }

  @override
  Future<int> getTodayStep() {
    return Future.value(123);
  }

  @override
  Future<int> getStep({required DateTime from, required DateTime to}) {
    return Future.value(999);
  }
  
}

void main() {
  final FlutterPedometerPlatform initialPlatform = FlutterPedometerPlatform.instance;

  test('$MethodChannelFlutterPedometer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPedometer>());
  });

  test('isStepAvailable', () async {
    MockFlutterPedometerPlatform fakePlatform = MockFlutterPedometerPlatform();
    FlutterPedometerPlatform.instance = fakePlatform;
  });

  test('getPermissionStatus', () async {
    MockFlutterPedometerPlatform fakePlatform = MockFlutterPedometerPlatform();
    FlutterPedometerPlatform.instance = fakePlatform;
  });

  test('getTodayStep', () async {
    MockFlutterPedometerPlatform fakePlatform = MockFlutterPedometerPlatform();
    FlutterPedometerPlatform.instance = fakePlatform;
  });

  test('getStep', () async {
    MockFlutterPedometerPlatform fakePlatform = MockFlutterPedometerPlatform();
    FlutterPedometerPlatform.instance = fakePlatform;
  });
}
