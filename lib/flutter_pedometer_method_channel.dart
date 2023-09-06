import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pedometer/pedometer_permission_status.dart';

import 'flutter_pedometer_platform_interface.dart';

/// An implementation of [FlutterPedometerPlatform] that uses method channels.
class MethodChannelFlutterPedometer extends FlutterPedometerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pedometer');

  @override
  Future<bool> isStepAvailable() async {
    final bool result = await methodChannel.invokeMethod('isStepAvailable');

    return result;
  }

  @override
  Future<PedometerPermissionStatus> getPermissionStatus() async {
    final int result = await methodChannel.invokeMethod('getPermissionStatus');

    switch (result) {
      case 0:
        return PedometerPermissionStatus.notDetermined;

      case 1:
        return PedometerPermissionStatus.restricted;

      case 2:
        return PedometerPermissionStatus.denied;

      case 3:
        return PedometerPermissionStatus.granted;
      
      default:
        return PedometerPermissionStatus.notDetermined;
    }
  }

  @override
  Future<int?> getTodayStep() async {
    
    final DateTime to = DateTime.now();

    final DateTime from = DateTime(to.year, to.month, to.day);

    final Map<String, dynamic> arguments = {
      'from': from.millisecondsSinceEpoch,
      'to': to.millisecondsSinceEpoch,
    };

    final int? result = await methodChannel.invokeMethod('getTodayStep', arguments);

    return result;
  }

  @override
  Future<int?> getStep({
    required DateTime from,
    required DateTime to,
  }) async {

    final Map<String, dynamic> arguments = {
      'from': from.millisecondsSinceEpoch,
      'to': to.millisecondsSinceEpoch,
    };

    final int? result = await methodChannel.invokeMethod('getStep', arguments);

    return result;
  }
}
