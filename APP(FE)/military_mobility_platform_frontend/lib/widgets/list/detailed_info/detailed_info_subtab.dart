import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/widgets/list/detailed_info/mobility_community.dart';
import 'package:military_mobility_platform_frontend/widgets/list/detailed_info/mobility_manual.dart';

class DetailedInfoSubTab extends StatefulWidget {
  const DetailedInfoSubTab(this.requestedMobility, {super.key});
  final RequestedMobilityDTO requestedMobility;

  @override
  DetailedInfoSubTabState createState() => DetailedInfoSubTabState();
}

class DetailedInfoSubTabState extends State<DetailedInfoSubTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> tabs = <Tab>[
    Tab(text: '차량사용법'),
    Tab(text: '커뮤니티'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
        child: Column(children: [
      TabBar(
        tabs: tabs,
        controller: _tabController,
        indicatorColor: theme.primaryColor,
        labelColor: theme.primaryColor,
        unselectedLabelColor: Colors.black,
      ),
      Expanded(
          child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          MobilityManual(widget.requestedMobility.mobility),
          const MobilityCommunity()
        ],
      ))
    ]));
  }
}
