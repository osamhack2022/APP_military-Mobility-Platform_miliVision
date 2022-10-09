import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';
import 'package:provider/provider.dart';

class RequestMobilityButton extends StatelessWidget {
  const RequestMobilityButton(this.mobility, {super.key});

  final MobilityDTO mobility;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120.0,
        child: ElevatedButton(
            onPressed: () => _requestMobility(context),
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Icon(Icons.add), Text('선택하기')])));
  }

  void _requestMobility(BuildContext context) {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final mobilityRequestProvider =
          Provider.of<MobilityRequestProvider>(context, listen: false);
      mobilityRequestProvider.makeReservation(
          authProvider.authenticatedClient!, mobility);
      showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
                title: const Text('배차 신청이 완료되었습니다.'),
                content: const Text(
                    '배차 진행 현황은 [배차확인] 탭에서 확인할 수 있으며. 수송업무 담당자의 승인 후 차량을 이용할 수 있습니다.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        Provider.of<NavigationProvider>(context, listen: false)
                            .animateToTabWithName('list');
                      },
                      child: const Text('닫기'))
                ],
              ));
    } catch (exception) {
      print(exception);
      Toast.showFailToast('배차 신청에 실패했습니다.');
    }
  }
}
