import 'dart:math';

import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:provider/provider.dart';

class PassengersSection extends StatelessWidget {
  const PassengersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobilityRequestProvider =
        Provider.of<MobilityRequestProvider>(context);
    final drivers = mobilityRequestProvider.drivers;
    final seniorPassengers = mobilityRequestProvider.seniorPassengers;
    final passengers = mobilityRequestProvider.passengers;
    final summary = '운전자 $drivers명, 선탑자 $seniorPassengers명, 탑승자 $passengers명';
    return Column(children: [
      const Text('탑승인원'),
      Padding(padding: const EdgeInsets.only(top: 30.0), child: Text(summary)),
      Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ChangeNotifierProvider.value(
                      value: mobilityRequestProvider,
                      child: const PassengersSelectModal())),
              icon: const Icon(Icons.add))),
    ]);
  }
}

class PassengersSelectModal extends StatefulWidget {
  const PassengersSelectModal({super.key});

  @override
  PassengersSelectModalState createState() => PassengersSelectModalState();
}

class PassengersSelectModalState extends State<PassengersSelectModal> {
  int _drivers = 0;
  int _seniorPassengers = 0;
  int _passengers = 0;

  PassengersSelectModalState();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mobilityRequestProvider =
          Provider.of<MobilityRequestProvider>(context, listen: false);
      setState(() {
        _drivers = mobilityRequestProvider.drivers;
        _seniorPassengers = mobilityRequestProvider.seniorPassengers;
        _passengers = mobilityRequestProvider.passengers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNumberField('운전자',
              getter: () => _drivers,
              setter: (n) => setState(() => _drivers = n)),
          _buildNumberField('선탑자',
              getter: () => _seniorPassengers,
              setter: (n) => setState(() => _seniorPassengers = n)),
          _buildNumberField('탑승자',
              getter: () => _passengers,
              setter: (n) => setState(() => _passengers = n)),
          TextButton(
              onPressed: () {
                Provider.of<MobilityRequestProvider>(context, listen: false)
                    .setPassengers(
                        drivers: _drivers,
                        seniorPassengers: _seniorPassengers,
                        passengers: _passengers);
                Navigator.pop(context);
              },
              child: const Text('Apply'))
        ]);
  }

  Widget _buildNumberField(String name,
      {required int Function() getter, required void Function(int) setter}) {
    return Row(children: [
      Text(name),
      IconButton(
          onPressed: () => setter(max(0, getter() - 1)),
          icon: const Icon(Icons.remove)),
      Text('${getter()}'),
      IconButton(
          onPressed: () => setter(getter() + 1), icon: const Icon(Icons.add)),
    ]);
  }
}
