import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/widgets/request/select_mobility/mobility_list.dart';

class SelectMobilityTab extends StatelessWidget {
  const SelectMobilityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 20.0), child: MobilityList());
  }
}
