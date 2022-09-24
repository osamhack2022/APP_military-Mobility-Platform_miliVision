import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:military_mobility_platform_frontend/widgets/request/location_selector.dart';
import 'package:provider/provider.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TitleProvider>(context, listen: false).setTitle('배차신청');
    });
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 50.0), child: LocationSelector()),
        Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
            child: Divider(
              thickness: 1.0,
              color: theme.dividerColor,
            )),
      ],
    );
  }
}
