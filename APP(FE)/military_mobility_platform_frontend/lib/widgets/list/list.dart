import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/widgets/list/listview.dart';
import 'package:provider/provider.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final reservationListProvider =
        Provider.of<ReservationListProvider>(context, listen: false);

    return FutureBuilder(
        future:
            reservationListProvider.getReservations(authProvider.authenticatedClient!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  Icon(Icons.error, size: 50.0),
                  Text('로딩 중 에러가 발생했습니다.')
                ]));
          } else {
            return const Padding(
                padding: EdgeInsets.only(top: 17.0),
                child: RequestedMobilityListView());
          }
        });
  }
}
