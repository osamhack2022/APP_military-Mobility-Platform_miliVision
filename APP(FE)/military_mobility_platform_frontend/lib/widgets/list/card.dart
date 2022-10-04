import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/widgets/list/cancle_dialog.dart';

class RequestedMobilityCard extends StatelessWidget {
  final RequestedMobilityDTO requestedMobility;
  const RequestedMobilityCard(this.requestedMobility, {super.key});

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
    final style =
        GoogleFonts.roboto(color: const Color(0xFF898989), fontSize: 16);
    final mobility = requestedMobility.mobility;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(mobility.id, style: style),
          Text(mobility.type, style: style),
          Text('${mobility.fuelType}|${mobility.color}', style: style),
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
                onPressed: () => print('상세정보'), child: const Text('상세정보')),
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
