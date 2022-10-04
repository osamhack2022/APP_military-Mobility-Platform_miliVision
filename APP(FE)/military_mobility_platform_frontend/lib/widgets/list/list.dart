import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_list.dart';
import 'package:military_mobility_platform_frontend/widgets/list/listview.dart';
import 'package:provider/provider.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final requestedMobilityListProvider =
        Provider.of<RequestedMobilityListProvider>(context, listen: false);
    requestedMobilityListProvider.request();
    return const Padding(
        padding: EdgeInsets.only(top: 17.0), child: RequestedMobilityList());
  }
}
