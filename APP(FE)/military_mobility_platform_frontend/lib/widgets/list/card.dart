import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/service/mobility_assets.dart';
import 'package:military_mobility_platform_frontend/widgets/list/cancle_dialog.dart';
import 'package:provider/provider.dart';

class RequestedMobilityCard extends StatelessWidget {
  final ReservationDTO reservation;
  final int index;
  const RequestedMobilityCard(this.reservation, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildRequestStatusSection(context),
          Image(image: MobilityAssets.getMobilityImage('type 임시')),
          _buildInfoSection(context),
          _buildButtonSection(context),
        ]));
  }

  Widget _buildRequestStatusSection(BuildContext context) {
    return SizedBox(
        height: 90.0,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAcceptStatusSection(),
                  _buildDateTimeSection(context),
                ])));
  }

  Widget _buildAcceptStatusSection() {
    Widget acceptStatusText;
    if (reservation.waiting) {
      acceptStatusText = const Text('승인대기중');
    } else if (reservation.accepted) {
      acceptStatusText =
          Text('배차완료', style: GoogleFonts.roboto(color: Colors.blue));
    } else {
      acceptStatusText =
          Text('배차불가', style: GoogleFonts.roboto(color: Colors.red));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [const Text('배차상태: '), acceptStatusText]);
  }

  Widget _buildDateTimeSection(BuildContext context) {
    final theme = Theme.of(context);
    final startTime =
        DateFormat('MM.dd a HH:mm').format(reservation.startTime).toLowerCase();
    final endTime =
        DateFormat('MM.dd a HH:mm').format(reservation.endTime).toLowerCase();
    return Text('$startTime ~ $endTime', style: theme.textTheme.bodySmall);
  }

  Widget _buildInfoSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mobility = reservation.mobility;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('id 임시', style: textTheme.labelMedium),
          Text('type 임시', style: textTheme.labelMedium),
          Text('fuelType 임시|color 임시', style: textTheme.labelMedium),
        ]));
  }

  Widget _buildButtonSection(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
                onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (buildContext) => CancelRequestDialog(
                        reservation: reservation, parentContext: context)),
                child: const Text('신청취소')),
            TextButton(
                onPressed: () {
                  Provider.of<ReservationListProvider>(context, listen: false)
                      .select(index);
                  Provider.of<NavigationProvider>(context, listen: false)
                      .animateToTabWithName('detailed info');
                },
                child: const Text('상세정보')),
          ]),
          SizedBox(
              width: 90.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconButton(onPressed: null, icon: Icon(Icons.favorite)),
                    IconButton(onPressed: null, icon: Icon(Icons.notifications))
                  ]))
        ]));
  }
}
