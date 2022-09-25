import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:provider/provider.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonStyle = ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent));
    final buttonTextStyle =
        GoogleFonts.roboto(fontSize: 40.0, color: Colors.black);

    final mobilityRequestProvider =
        Provider.of<MobilityRequestProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(children: [
          const Text('출발'),
          TextButton(
              style: buttonStyle,
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => LocationSelectModal((location) =>
                      mobilityRequestProvider.setLocations(
                          departure: location))),
              child: Text(mobilityRequestProvider.departure,
                  style: buttonTextStyle))
        ]),
        const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Icon(Icons.navigate_next, size: 30.0)),
        Column(children: [
          const Text('도착'),
          TextButton(
              style: buttonStyle,
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => LocationSelectModal((location) =>
                      mobilityRequestProvider.setLocations(
                          destination: location))),
              child: Text(mobilityRequestProvider.destination,
                  style: buttonTextStyle))
        ]),
      ],
    );
  }
}

class LocationSelectModal extends StatelessWidget {
  final void Function(String) setter;
  const LocationSelectModal(this.setter, {super.key});

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
            setter(kLocations[index]);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
