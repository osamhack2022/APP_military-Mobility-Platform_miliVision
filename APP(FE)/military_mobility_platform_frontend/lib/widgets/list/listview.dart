import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/widgets/list/card.dart';
import 'package:provider/provider.dart';

class RequestedMobilityListView extends StatelessWidget {
  const RequestedMobilityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final requestedMobilityListProvider =
        Provider.of<ReservationListProvider>(context);
    final mobilities = requestedMobilityListProvider.reservations;
    return ListView.builder(
        itemCount: mobilities.length,
        itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
            child: RequestedMobilityCard(mobilities[index], index)));
  }
}
