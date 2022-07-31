import 'package:flutter/material.dart';
import 'package:odc_task/app_cubit/cubit/app_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySlider extends StatelessWidget {
  final int type;
  const MySlider({required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Card(
          color: Colors.white,
          elevation: 10,
          child: SizedBox(
            height: 300,
            width: 80,
            child: SfSlider.vertical(
              inactiveColor: Colors.grey,
              min: 0.0,
              max: 140.0,
              value: type == 1
                  ? AppCubit.get(context).value_for_slider_levels
                  : AppCubit.get(context).value_for_slider_presure,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (value) {
                if (type == 1) {
                  if (AppCubit.get(context).clicked == false) {
                    AppCubit.get(context).changeValueSliderpLevels(value);
                  }
                } else {
                  if (AppCubit.get(context).clicked == false) {
                    AppCubit.get(context).changeValueSliderpPresure(value);
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}

// class MySlider extends StatefulWidget {
//   const MySlider({ Key? key}) : super(key: key);
 
//   @override
//   State<MySlider> createState() => _MySliderState();
// }

// class _MySliderState extends State<MySlider> {
//   @override
//   Widget build(BuildContext context) {
    // return BlocBuilder<AppCubit, AppState>(
    //   builder: (context, state) {
    //     return SfSlider.vertical(
    //       min: 0.0,
    //       max: 100.0,
    //       value: AppCubit.get(context).value_for_slider,
    //       interval: 20,
    //       showTicks: true,
    //       showLabels: true,
    //       enableTooltip: true,
    //       minorTicksPerInterval: 1,
    //       onChanged: ( value) {
    //         AppCubit.get(context).changeValueSlider(value);
    //       },
    //     );
    //   },
    // );
//   }
// }
