import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_list.dart';
import 'package:military_mobility_platform_frontend/widgets/list/card.dart';
import 'package:provider/provider.dart';

class RequestedMobilityList extends StatelessWidget {
  const RequestedMobilityList({super.key});

  @override
  Widget build(BuildContext context) {
    final requestedMobilityListProvider =
        Provider.of<RequestedMobilityListProvider>(context);
    final mobilities = requestedMobilityListProvider.mobilities;
    return ListView.builder(
        itemCount: mobilities.length,
        itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
            child: RequestedMobilityCard(mobilities[index])));
  }
}
