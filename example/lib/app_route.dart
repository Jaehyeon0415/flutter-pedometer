import 'package:flutter/material.dart';

import 'package:flutter_pedometer_example/home_page.dart';
import 'package:flutter_pedometer_example/pedometer_page.dart';

class RouteName {
  static const String home = '/';
  static const String pedometer = '/pedometer';
}

class AppRoute {

  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    Route<dynamic>? result;

    switch (settings.name) {
      case RouteName.home:
        result = MaterialPageRoute(builder: (_) => const HomePage());
        break;

      case RouteName.pedometer:
        result = MaterialPageRoute(builder: (_) => const PedometerPage());
        break;

      default:
        break;
    }


    return result;
  }

}