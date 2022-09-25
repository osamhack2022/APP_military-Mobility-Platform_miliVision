import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:military_mobility_platform_frontend/widgets/request/detailed_option_section.dart';
import 'package:military_mobility_platform_frontend/widgets/request/location_section.dart';
import 'package:military_mobility_platform_frontend/widgets/request/passengers_section.dart';
import 'package:provider/provider.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TitleProvider>(context, listen: false).setTitle('배차신청');
    });
    return ChangeNotifierProvider(
      create: (context) => MobilityRequestProvider(),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 40.0), child: LocationSection()),
          _buildDivider(context),
          const PassengersSection(),
          _buildDivider(context),
          const DetailedOptionSection(),
          _buildDivider(context),
          _buildRequestButton(context),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Divider(
          thickness: 1.0,
          color: theme.dividerColor,
        ));
  }

  Widget _buildRequestButton(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
        onPressed: null,
        child: Text('배차 가능 차량 검색', style: theme.textTheme.bodyMedium));
  }
}
