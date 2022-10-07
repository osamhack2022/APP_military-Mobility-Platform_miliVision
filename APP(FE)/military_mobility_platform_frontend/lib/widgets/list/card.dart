import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_list.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/widgets/list/cancle_dialog.dart';
import 'package:provider/provider.dart';

class RequestedMobilityCard extends StatelessWidget {
  final RequestedMobilityDTO requestedMobility;
  final int index;
  const RequestedMobilityCard(this.requestedMobility, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildRequestStatusSection(context),
          const Image(image: AssetImage('assets/images/blank.jpg')),
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
    if (requestedMobility.waiting) {
      acceptStatusText = const Text('승인대기중');
    } else if (requestedMobility.accepted) {
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
    final departureTime = DateFormat('MM.dd a HH:mm')
        .format(requestedMobility.departureTime)
        .toLowerCase();
    final arrivalTime = DateFormat('MM.dd a HH:mm')
        .format(requestedMobility.arrivalTime)
        .toLowerCase();
    return Text('$departureTime ~ $arrivalTime',
        style: theme.textTheme.bodySmall);
  }

  Widget _buildInfoSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mobility = requestedMobility.mobility;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(mobility.id, style: textTheme.labelMedium),
          Text(mobility.type, style: textTheme.labelMedium),
          Text('${mobility.fuelType}|${mobility.color}',
              style: textTheme.labelMedium),
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
                    builder: (context) =>
                        CancelRequestDialog(requestedMobility)),
                child: const Text('신청취소')),
            TextButton(
                onPressed: () {
                  Provider.of<RequestedMobilityListProvider>(context,
                          listen: false)
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
