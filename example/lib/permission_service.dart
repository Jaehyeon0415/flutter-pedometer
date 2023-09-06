import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  static Future<bool> requestMotion() async {

    final PermissionStatus status = Platform.isAndroid
      ? await Permission.activityRecognition.request()
      : await Permission.sensors.request();

    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return true;

      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
      case PermissionStatus.restricted:
      default:
        return false;
    }

  }

}