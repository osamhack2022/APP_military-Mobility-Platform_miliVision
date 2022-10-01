import 'package:flutter/material.dart';

class AccidentReport extends StatelessWidget {
  const AccidentReport({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '사고접수';
    return Container(
      width: 200,
      height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1.0),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.car_crash_outlined, size: 75),
          ),
          Text(subtitle),
        ]
      )
    );
  }
}