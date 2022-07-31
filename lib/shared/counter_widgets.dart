import 'package:flutter/material.dart';
import 'package:odc_task/app_cubit/cubit/app_cubit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  Counter({required this.myValue, required this.type, Key? key})
      : super(key: key);
  num? myValue;
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        myValue = type == 1
            ? AppCubit.get(context).value_for_slider_levels.toDouble()
            : AppCubit.get(context).value_for_slider_presure.toDouble();
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
                      child: Text(myValue!.toInt().toString(),
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
// class Counter extends StatefulWidget {
//   /// Creates the instance of Counter
//   Counter({Key? key}) : super(key: key);

//   @override
//   _CounterState createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   Widget _getGauge({bool isRadialGauge = true}) {
//     if (isRadialGauge) {
//       return _getRadialGauge();
//     } else {
//       return _getLinearGauge();
//     }
//   }

//   Widget _getRadialGauge() {
//     return BlocBuilder<AppCubit, AppState>(
//       builder: (context, state) {
    //     return SfRadialGauge(axes: <RadialAxis>[
    //       RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
    //         GaugeRange(
    //             startValue: 0,
    //             endValue: 50,
    //             color: Colors.green,
    //             startWidth: 10,
    //             endWidth: 10),
    //         GaugeRange(
    //             startValue: 50,
    //             endValue: 100,
    //             color: Colors.orange,
    //             startWidth: 10,
    //             endWidth: 10),
    //         GaugeRange(
    //             startValue: 100,
    //             endValue: 150,
    //             color: Colors.red,
    //             startWidth: 10,
    //             endWidth: 10)
    //       ], pointers: <GaugePointer>[
    //         NeedlePointer(value: AppCubit.get(context).value_for_slider ??  0)
    //       ], annotations: <GaugeAnnotation>[
    //         GaugeAnnotation(
    //             widget: Container(
    //                 child: Text(
    //                     AppCubit.get(context).value_for_slider!.toString(),
    //                     style: TextStyle(
    //                         fontSize: 25, fontWeight: FontWeight.bold))),
    //             angle: 90,
    //             positionFactor: 0.5)
    //       ])
    //     ]);
    //   },
    // );
//   }

//   Widget _getLinearGauge() {
//     return Container(
//       child: SfLinearGauge(
//           minimum: 0.0,
//           maximum: 100.0,
//           orientation: LinearGaugeOrientation.horizontal,
//           majorTickStyle: LinearTickStyle(length: 20),
//           axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
//           axisTrackStyle: LinearAxisTrackStyle(
//               color: Colors.cyan,
//               edgeStyle: LinearEdgeStyle.bothFlat,
//               thickness: 15.0,
//               borderColor: Colors.grey)),
//       margin: EdgeInsets.all(10),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: _getGauge(),
//       width: 500,
//       height: 300,
//     );
//   }
// }
