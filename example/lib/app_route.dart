import 'package:flutter/material.dart';

import 'package:flutter_pedometer_example/home_page.dart';
import 'package:flutter_pedometer_example/ios_pedometer_page.dart';
import 'package:flutter_pedometer_example/aos_pedometer_page.dart';

class RouteName {
  static const String home = '/';
  static const String iosPedometer = '/ios-pedometer';
  static const String aosPedometer = '/aos-pedometer';
}

class AppRoute {

  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    // final Object? arguments = settings.arguments;

    Route<dynamic>? result;

    switch (settings.name) {
      case RouteName.home:
        result = MaterialPageRoute(builder: (_) => const HomePage());
        break;

      case RouteName.iosPedometer:
        result = MaterialPageRoute(builder: (_) => const IOSPedometerPage());
        break;
      
      case RouteName.aosPedometer:
        result = MaterialPageRoute(builder: (_) => const AOSPedometerPage());
        break;

      default:
        break;
    }


    return result;
  }

}