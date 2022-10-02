import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_list.dart';
import 'package:provider/provider.dart';

class SelectMobilityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobilityListProvider = Provider.of<MobilityListProvider>(context);
    return Center(
        child:
            Text(mobilityListProvider.mobilities.map((e) => e.id).toString()));
  }
}
