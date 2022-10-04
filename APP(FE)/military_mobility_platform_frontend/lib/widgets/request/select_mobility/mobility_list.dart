import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_list.dart';
import 'package:provider/provider.dart';

class MobilityList extends StatelessWidget {
  const MobilityList({super.key});

  @override
  Widget build(BuildContext context) {
    _showSnackbar(context);
    final mobilityListProvider = Provider.of<MobilityListProvider>(context);
    final mobilities = mobilityListProvider.mobilities;
    final theme = Theme.of(context);
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              leading: const Image(
                image: AssetImage('assets/images/blank.jpg'),
                height: 70.0,
                width: 70.0,
                fit: BoxFit.fitWidth,
              ),
              title: Text(mobilities[index].id),
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
              trailing: SizedBox(
                  width: 120.0,
                  child: ElevatedButton(
                      onPressed: () => print('select'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [Icon(Icons.add), Text('선택하기')]))),
              isThreeLine: true,
            ),
        separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 1.0)),
        itemCount: mobilities.length);
  }

  void _showSnackbar(BuildContext context) {
    final mobilities = Provider.of<MobilityListProvider>(context).mobilities;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final content = '요청하신 조건에 총 ${mobilities.length}대의 차량이 선택 가능합니다.';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(elevation: 2.0, content: Text(content)));
    });
  }
}