import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pedometer/flutter_pedometer.dart';

class AOSPedometerPage extends StatefulWidget {
  const AOSPedometerPage({super.key});

  @override
  State<AOSPedometerPage> createState() => _AOSPedometerPageState();
}

class _AOSPedometerPageState extends State<AOSPedometerPage> {

  StreamSubscription<int>? stepDetectionController;

  @override
  void initState() {
    super.initState();

    stepDetectionController = FlutterPedometer.stepDetectionStream.listen((event) {
      debugPrint('[AOS_PEDOMETER_PAGE] stepDetectionStream => $event');
    });
  }

  @override
  void dispose() {
    stepDetectionController?.cancel();
    super.dispose();
  }

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
          'AOS Pedometer',
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
              sliver: SliverList(delegate: SliverChildListDelegate([

                StreamBuilder(
                  stream: FlutterPedometer.stepCountStream,
                  builder: (_, snapshot) {
                    debugPrint('[AOS_PEDOMETER] stepCountStream => ${snapshot.data}');

                    return Row(
                      children: [

                        const Expanded(
                          child: Text(
                            'step: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Text(
                            '${snapshot.data}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),

                      ],
                    );
                  }
                ),

              ])),
            ),
          ),
        ],
      ),
    );
  }
}