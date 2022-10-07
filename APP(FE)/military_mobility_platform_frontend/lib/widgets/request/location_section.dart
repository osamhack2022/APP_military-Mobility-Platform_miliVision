import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:military_mobility_platform_frontend/constatns/locations.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:military_mobility_platform_frontend/service/hangul.dart';
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

class LocationSelectModal extends StatefulWidget {
  final void Function(String) setter;
  const LocationSelectModal(this.setter, {super.key});

  @override
  LocationSelectModalState createState() => LocationSelectModalState();
}

class LocationSelectModalState extends State<LocationSelectModal> {
  String _searchKeyword = "";
  LocationSelectModalState();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(children: [
          _buildSearchField(),
          Expanded(child: _buildListView()),
        ]));
  }

  Widget _buildSearchField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
            height: 40.0,
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (value) => setState(() => _searchKeyword = value),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.search),
                  )),
            )));
  }

  Widget _buildListView() {
    final locations = _getFilteredLocations();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      itemCount: (locations.length / 2).round(),
      itemBuilder: (context, index) {
        final loc1 = index * 2 < locations.length ? locations[index * 2] : null;
        final loc2 =
            index * 2 + 1 < locations.length ? locations[index * 2 + 1] : null;
        return Row(children: [
          _buildListTile(loc1),
          _buildListTile(loc2),
        ]);
      },
    );
  }

  Widget _buildListTile(String? location) {
    return Expanded(
        child: ListTile(
      title: Center(child: Text(location ?? "")),
      onTap: location != null
          ? () {
              widget.setter(location);
              Navigator.pop(context);
            }
          : null,
    ));
  }

  List<String> _getFilteredLocations() {
    final hangulMatcher = getHangulMatcher(_searchKeyword);
    return kLocations
        .where((element) => hangulMatcher.hasMatch(element))
        .toList();
  }
}
