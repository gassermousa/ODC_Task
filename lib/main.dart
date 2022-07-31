import 'package:flutter/material.dart';
import 'package:odc_task/app_cubit/cubit/app_cubit.dart';
import 'package:odc_task/screen/home_screen.dart';
import 'package:odc_task/screen/test.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  return runApp(GaugeApp());
}

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Radial Gauge Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      ),
    );
  }
}

/// Represents MyHomePage class
