import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:military_mobility_platform_frontend/service/mobility_assets.dart';
import 'package:military_mobility_platform_frontend/widgets/request/select_mobility/request_button.dart';
import 'package:provider/provider.dart';

class SelectMobilityTab extends StatelessWidget {
  const SelectMobilityTab({super.key});

  @override
  Widget build(BuildContext context) {
    final mobilityListProvider = Provider.of<MobilityRequestProvider>(context);
    final mobilities = mobilityListProvider.availableMobilities;
    final theme = Theme.of(context);
    return ListView.separated(
        itemCount: mobilities.length,
        itemBuilder: (context, index) => ListTile(
              leading: Image(
                image: MobilityAssets.getMobilityImage(mobilities[index].type),
                height: 100.0,
                fit: BoxFit.fitHeight,
              ),
              title: Text(mobilities[index].id.toString()),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mobilities[index].type,
                      style: theme.textTheme.labelMedium,
                    ),
                    Text(
                        "${mobilities[index].fuelType}|${mobilities[index].color}",
                        style: theme.textTheme.labelMedium),
                  ]),
              trailing: RequestMobilityButton(mobilities[index]),
              isThreeLine: true,
            ),
        separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 1.0)));
  }
}
