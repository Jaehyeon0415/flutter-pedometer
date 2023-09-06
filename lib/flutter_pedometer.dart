
import 'package:flutter_pedometer/pedometer_permission_status.dart';

import 'flutter_pedometer_platform_interface.dart';

class FlutterPedometer {

  static Future<bool> isStepAvailable() {
    return FlutterPedometerPlatform.instance.isStepAvailable();
  }

  static Future<PedometerPermissionStatus> getPermissionStatus() {
    return FlutterPedometerPlatform.instance.getPermissionStatus();
  }

  static Future<int?> getTodayStep() async {
    return FlutterPedometerPlatform.instance.getTodayStep();
  }

  static Future<int?> getStep({
    required DateTime from,
    required DateTime to,
  }) async {
    return FlutterPedometerPlatform.instance.getStep(from: from, to: to);
  }
}
