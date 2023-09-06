import 'package:flutter/material.dart';
import 'package:flutter_pedometer_example/app_route.dart';
import 'package:flutter_pedometer_example/permission_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.2,
        centerTitle: true,
        title: const Text(
          'Flutter Pedometer',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverSafeArea(
            sliver: SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      PermissionService.requestMotion().then((value) {
                        if (value == false) {
                          return;
                        }

                        Navigator.pushNamed(context, RouteName.pedometer);
                      });
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.shade400,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        child: Text(
                          'Go to Pedometer',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}