import 'package:flutter/material.dart';
import 'package:odc_task/app_cubit/cubit/app_cubit.dart';
import 'package:odc_task/screen/test.dart';
import 'package:odc_task/shared/btn.dart';
import 'package:odc_task/shared/counter_widgets.dart';
import 'package:odc_task/shared/slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Row(
            children: [
              Column(
                children: [
                  Counter(
                      type: 0,
                      myValue: AppCubit.get(context).value_for_counter_presure),
                  MySlider(
                    type: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 440),
                    child: defaultbtn(
                        prim_color: AppCubit.get(context).clicked
                            ? Colors.green
                            : Colors.red,
                        text: AppCubit.get(context).clicked ? 'on' : 'off',
                        onpress: () {
                          AppCubit.get(context).clickedBtn();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 440),
                    child: defaultbtn(
                        prim_color: Colors.blue,
                        text: 'task 2',
                        onpress: () {
                          navigateTo(context, TestScreen());
                        }),
                  )
                ],
              ),
              Column(
                children: [
                  Counter(
                      type: 1,
                      myValue: AppCubit.get(context).value_for_counter_levels),
                  MySlider(type: 1),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
