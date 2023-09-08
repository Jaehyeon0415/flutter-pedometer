import 'package:flutter/material.dart';
import 'package:flutter_pedometer/flutter_pedometer.dart';
import 'package:flutter_pedometer/pedometer_permission_status.dart';

class IOSPedometerPage extends StatefulWidget {
  const IOSPedometerPage({super.key});

  @override
  State<IOSPedometerPage> createState() => _IOSPedometerPageState();
}

class _IOSPedometerPageState extends State<IOSPedometerPage> {

  bool isStepAvailable = false;
  PedometerPermissionStatus status = PedometerPermissionStatus.notDetermined;
  int? todayStep;
  int? step;

  @override
  void initState() {
    super.initState();
    updateIsStepAvailable();
    updateStatus();
    updateTodayStep();
    updateStep();
  }

  void updateIsStepAvailable() async {
    final bool result = await FlutterPedometer.isStepAvailable();

    setState(() {
      isStepAvailable = result;
    });
  }

  void updateStatus() async {
    final PedometerPermissionStatus result = await FlutterPedometer.getPermissionStatus();

    setState(() {
      status = result;
    });
  }

  void updateTodayStep() async {
    final int? result = await FlutterPedometer.getTodayStep();

    debugPrint('[updateTodayStep] $result');

    setState(() {
      todayStep = result;
    });
  }

  void updateStep() async {
    final DateTime now = DateTime.now();

    final DateTime to = DateTime(now.year, now.month, now.day + 1);

    final DateTime from = DateTime(now.year, now.month, now.day - 6);

    debugPrint('updateStep $from ~ $to');

    final int? result = await FlutterPedometer.getStep(from: from, to: to);

    debugPrint('[updateStep] $result');

    setState(() {
      step = result;
    });
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
          'IOS Pedometer',
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

                InkWell(
                  onTap: updateIsStepAvailable,
                  child: Row(
                    children: [

                      const Expanded(
                        child: Text(
                          'isStepAvailable: ',
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
                          '$isStepAvailable',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),

                    ],
                  ),
                ),

                Divider(height: 20, thickness: 1, color: Colors.grey.shade400),

                InkWell(
                  onTap: updateStatus,
                  child: Row(
                    children: [

                      const Expanded(
                        child: Text(
                          'status: ',
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
                          '$status',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),

                    ],
                  ),
                ),

                Divider(height: 20, thickness: 1, color: Colors.grey.shade400),

                InkWell(
                  onTap: updateTodayStep,
                  child: Row(
                    children: [

                      const Expanded(
                        child: Text(
                          'todayStep: ',
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
                          '$todayStep',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),

                    ],
                  ),
                ),

                Divider(height: 20, thickness: 1, color: Colors.grey.shade400),

                InkWell(
                  onTap: updateStep,
                  child: Row(
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
                          '$step',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),

                    ],
                  ),
                ),

              ])),
            ),
          ),
        ],
      ),
    );
  }
}