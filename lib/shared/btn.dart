import 'package:flutter/material.dart';

Widget defaultbtn({
  Color? prim_color,
  required String text,
  double? radius,
  required Function onpress,
}) =>
    Container(
      width: 150.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0))),
      child: ElevatedButton(
        onPressed: () {
          onpress();
        },
        style: ElevatedButton.styleFrom(primary: prim_color),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
