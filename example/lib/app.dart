import 'package:flutter/material.dart';
import 'package:flutter_pedometer_example/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Pedometer',
      debugShowCheckedModeBanner: false,
      locale: Locale('ko', 'KR'),
      onGenerateRoute: AppRoute.onGeneratedRoute,
    );
  }
}