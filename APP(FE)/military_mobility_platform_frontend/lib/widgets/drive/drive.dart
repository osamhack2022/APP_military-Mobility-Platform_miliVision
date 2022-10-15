import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:military_mobility_platform_frontend/provider/drive_info.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/service/snackbar.dart';
import 'package:military_mobility_platform_frontend/widgets/drive/map.dart';
import 'package:provider/provider.dart';

class DriveTab extends StatelessWidget {
  static const kZoom = 13.5;
  const DriveTab({super.key});

  @override
  Widget build(BuildContext context) {
    final driveInfoProvider = Provider.of<DriveInfoProvider>(context);
    if (!driveInfoProvider.selectionExists || !driveInfoProvider.isDriving) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Snackbar(context).showError('먼저 운행을 시작할 배차를 선택해주십시오.');
        Provider.of<NavigationProvider>(context, listen: false)
            .animateToTabWithName('list');
      });
      return const Center(child: CircularProgressIndicator());
    }

    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(height: height * 0.7, child: const DriveMap()),
      _buildInfoSection(context)
    ]);
  }

  Widget _buildInfoSection(BuildContext context) {
    return Expanded(
        child: Container(
            color: const Color(0xFFDFDFDF),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDrivingTime(context),
                  _buildDrivingDistance(context),
                ])));
  }

  Widget _buildDrivingTime(BuildContext context) {
    final style =
        GoogleFonts.roboto(fontSize: 36.0, fontWeight: FontWeight.bold);
    final time = Provider.of<DriveInfoProvider>(context).drivingTime!;
    final hours = time.inHours.toString().padLeft(2, '0');
    final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
    print(seconds);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('운행시간'),
      Text("$hours:$minutes:$seconds", style: style)
    ]);
  }

  Widget _buildDrivingDistance(BuildContext context) {
    final style =
        GoogleFonts.roboto(fontSize: 36.0, fontWeight: FontWeight.bold);
    final distance = Provider.of<DriveInfoProvider>(context).drivingDistance!;
    final formatter = NumberFormat('###0.00');
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('운행거리'),
      Text(
        "${formatter.format(distance)} KM",
        style: style,
      )
    ]);
  }
}
