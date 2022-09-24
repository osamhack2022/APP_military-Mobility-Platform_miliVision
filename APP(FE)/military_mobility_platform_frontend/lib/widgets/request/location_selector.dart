import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<LocationSelector> {
  String _departure = kLocations[0];
  String _destination = kLocations[0];

  _State();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(children: [
          Text('출발', style: theme.textTheme.bodyMedium),
          TextButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => LocationSelectModal(
                        (value) => setState(() {
                          _departure = value;
                        }),
                      )),
              child: Text(_departure, style: theme.textTheme.bodyLarge))
        ]),
        const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Icon(Icons.navigate_next, size: 30.0)),
        Column(children: [
          Text('도착', style: theme.textTheme.bodyMedium),
          TextButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => LocationSelectModal(
                        (value) => setState(() {
                          _destination = value;
                        }),
                      )),
              child: Text(_destination, style: theme.textTheme.bodyLarge))
        ]),
      ],
    );
  }
}

class LocationSelectModal extends StatelessWidget {
  final void Function(String) callback;
  const LocationSelectModal(this.callback) : super();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: kLocations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(kLocations[index], style: theme.textTheme.bodyMedium),
          onTap: () {
            callback(kLocations[index]);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
