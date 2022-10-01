import 'package:flutter/material.dart';

class VehicleReturn extends StatelessWidget {
  const VehicleReturn({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '차량 반납';
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
            child: Icon(Icons.subdirectory_arrow_left, size: 75),
          ),
          Text(subtitle),
        ]
      )
    );
  }
}