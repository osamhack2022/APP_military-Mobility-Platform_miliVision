import 'dart:math';

import 'package:flutter/material.dart';

class PassengersSelector extends StatefulWidget {
  const PassengersSelector({super.key});

  @override
  _State createState() => _State();
}

class PassengerData {
  int drivers = 0;
  int seniorPassengers = 0;
  int passengers = 0;
}

class _State extends State<PassengersSelector> {
  PassengerData data = PassengerData();
  _State();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final passengersSummary =
        '운전자 ${data.drivers}명, 선탑자 ${data.seniorPassengers}명, 탑승자 ${data.passengers}명';
    return Column(children: [
      Text('탑승인원', style: theme.textTheme.bodyMedium),
      Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(passengersSummary, style: theme.textTheme.bodyMedium)),
      Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => PassengersSelectModal(
                      data, (d) => setState(() => data = d))),
              icon: const Icon(Icons.add))),
    ]);
  }
}

class PassengersSelectModal extends StatefulWidget {
  PassengerData data;
  final void Function(PassengerData) callback;

  PassengersSelectModal(this.data, this.callback) : super();

  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<PassengersSelectModal> {
  _ModalState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNumberField('운전자', () => widget.data.drivers,
              (n) => setState(() => widget.data.drivers = n)),
          _buildNumberField('선탑자', () => widget.data.seniorPassengers,
              (n) => setState(() => widget.data.seniorPassengers = n)),
          _buildNumberField('탑승자', () => widget.data.passengers,
              (n) => setState(() => widget.data.passengers = n)),
          TextButton(
              onPressed: () {
                widget.callback(widget.data);
                Navigator.pop(context);
              },
              child: const Text('Apply'))
        ]);
  }

  Widget _buildNumberField(
      String name, int Function() getter, void Function(int) setter) {
    final theme = Theme.of(context);
    return Row(children: [
      Text(name, style: theme.textTheme.bodyMedium),
      IconButton(
          onPressed: () => setter(max(0, getter() - 1)),
          icon: const Icon(Icons.remove)),
      Text('${getter()}', style: theme.textTheme.bodyMedium),
      IconButton(
          onPressed: () => setter(getter() + 1), icon: const Icon(Icons.add)),
    ]);
  }
}
