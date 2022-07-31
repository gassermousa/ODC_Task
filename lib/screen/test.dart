import 'package:flutter/material.dart';
import 'dart:math';
import 'package:odc_task/app_cubit/cubit/app_cubit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double val_pre = 0.0;
  double val_level = 0.0;
  double oldValDx = 0.0;
  double oldValDy = 0.0;
  double disctance = 0.0;
  num mydelta = 0;
  double mydeltaOnY = 0;
  double mydeltaOnX = 0;
  Velocity speed = Velocity(pixelsPerSecond: Offset.zero);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        speed = details.velocity;
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          mydeltaOnX = details.delta.dx;
          mydeltaOnY = details.delta.dy;
          mydelta = sqrt(pow(mydeltaOnX, 2) + pow(mydeltaOnY, 2));
        });
      },
      onPanCancel: () {
        mydelta = 0;

        mydeltaOnX = 0;
        mydeltaOnY = 0;
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          val_level = details.globalPosition.dy / 10;
          val_pre = details.globalPosition.dx / 10;

          if (val_pre < 0) {
            val_pre = 0;
          }
          if (val_level < 0) {
            val_level = 0;
          }
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            CounterTest(myValue: val_pre),
            CounterTest(myValue: val_level),
            CounterTest(myValue: mydelta),
          ],
        ),
      ),
    );
  }
}

class CounterTest extends StatelessWidget {
  CounterTest({required this.myValue, Key? key}) : super(key: key);
  num? myValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SizedBox(
          height: 250.0,
          width: 250.0,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 140, ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 50,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10),
              GaugeRange(
                  startValue: 50,
                  endValue: 100,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10),
              GaugeRange(
                  startValue: 100,
                  endValue: 150,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10)
            ], pointers: <GaugePointer>[
              NeedlePointer(value: myValue!.toDouble())
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Text(
                          myValue!.toInt() > 140
                              ? '140'
                              : myValue!.toInt().toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 90,
                  positionFactor: 0.5)
            ])
          ]),
        );
      },
    );
  }
}
