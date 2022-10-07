import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:provider/provider.dart';

class PassengersSection extends StatelessWidget {
  const PassengersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text('탑승인원'),
      const Padding(
          padding: EdgeInsets.only(top: 30.0), child: Text('탑승 인원을 선택해주세요.')),
      Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildCounter(context)),
    ]);
  }

  Widget _buildCounter(BuildContext context) {
    final mobilityRequestProvider =
        Provider.of<MobilityRequestProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
            elevation: 1.0,
            fillColor: Colors.white54,
            shape: const CircleBorder(),
            onPressed: mobilityRequestProvider.decreasePassengers,
            child: const Icon(Icons.remove)),
        Text('${mobilityRequestProvider.passengers}명'),
        RawMaterialButton(
            elevation: 1.0,
            fillColor: Colors.white54,
            shape: const CircleBorder(),
            onPressed: mobilityRequestProvider.increasePassengers,
            child: const Icon(Icons.add)),
      ],
    );
  }
}
