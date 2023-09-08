
import 'package:flutter_pedometer/pedometer_permission_status.dart';

import 'flutter_pedometer_platform_interface.dart';

class FlutterPedometer {

  /// [Only Android] step count
  static Stream<int> get stepCountStream => FlutterPedometerPlatform.instance.stepCountStream;

  /// [Only Android] Detecting step. return 0 or 1
  static Stream<int> get stepDetectionStream => FlutterPedometerPlatform.instance.stepDetectionStream;

  /// [Only iOS] Check Pedometer Available
  static Future<bool> isStepAvailable() {
    return FlutterPedometerPlatform.instance.isStepAvailable();
  }

  /// [Only iOS] Get Pedometer permission status
  static Future<PedometerPermissionStatus> getPermissionStatus() {
    return FlutterPedometerPlatform.instance.getPermissionStatus();
  }

  /// [Only iOS] Get the number of steps based on today's date(GMT+9)
  static Future<int?> getTodayStep() async {
    return FlutterPedometerPlatform.instance.getTodayStep();
  }

  /// [Only iOS] Get the number of steps based on date
  static Future<int?> getStep({
    required DateTime from,
    required DateTime to,
  }) async {
    return FlutterPedometerPlatform.instance.getStep(from: from, to: to);
  }
}
