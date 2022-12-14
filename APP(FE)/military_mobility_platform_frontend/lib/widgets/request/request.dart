import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/service/snackbar.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';
import 'package:military_mobility_platform_frontend/widgets/request/time_section.dart';
import 'package:military_mobility_platform_frontend/widgets/request/location_section.dart';
import 'package:military_mobility_platform_frontend/widgets/request/passengers_section.dart';
import 'package:provider/provider.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const LocationSection(),
          _buildDivider(context),
          const PassengersSection(),
          _buildDivider(context),
          const TimeSection(),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          const RequestButton(),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Divider(
          thickness: 1.0,
        ));
  }
}

class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _request(context), child: const Text('배차 가능 차량 검색'));
  }

  void _request(BuildContext context) async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final mobilityRequestProvider =
          Provider.of<MobilityRequestProvider>(context, listen: false);
      await mobilityRequestProvider
          .getAvailableMobilities(authProvider.authenticatedClient!);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final navigationProvider =
            Provider.of<NavigationProvider>(context, listen: false);
        final mobilities = mobilityRequestProvider.availableMobilities.length;
        Snackbar(context).showInfo('요청하신 조건에 총 $mobilities대의 차량이 선택 가능합니다.');
        navigationProvider.animateToTabWithName('select mobility');
      });
    } catch (exception) {
      print(exception);
      Toast.showFailToast('차량 요청에 실패했습니다.');
    }
  }
}
