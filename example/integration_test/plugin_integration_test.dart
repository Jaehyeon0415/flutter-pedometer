// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'package:flutter_pedometer/pedometer_permission_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_pedometer/flutter_pedometer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('isStepAvailable test', (WidgetTester tester) async {
    final bool result = await FlutterPedometer.isStepAvailable();
    
    expect(result, true);
  });

  testWidgets('getPermissionStatus test', (WidgetTester tester) async {
    final PedometerPermissionStatus result = await FlutterPedometer.getPermissionStatus();
    
    expect(result, PedometerPermissionStatus.granted);
  });

  testWidgets('getTodayStep test', (WidgetTester tester) async {
    final int? result = await FlutterPedometer.getTodayStep();
    
    expect(result, 123);
  });

  testWidgets('getStep test', (WidgetTester tester) async {
    final DateTime to = DateTime.now();
    final DateTime from = DateTime(to.year, to.month, to.day);

    final int? result = await FlutterPedometer.getStep(from: from, to: to);
    
    expect(result, 999);
  });
}
