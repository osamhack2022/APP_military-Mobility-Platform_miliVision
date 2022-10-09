import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/reservation.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';
import 'package:provider/provider.dart';

class CancelRequestDialog extends StatelessWidget {
  const CancelRequestDialog(
      {required this.reservation, required this.parentContext, super.key});

  final ReservationDTO reservation;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("배차 신청을 취소하시겠습니까?"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('취소')),
        TextButton(
            onPressed: () => _cancelRequest(context), child: const Text('확인')),
      ],
    );
  }

  Future<void> _cancelRequest(BuildContext context) async {
    try {
      final authProvider =
          Provider.of<AuthProvider>(parentContext, listen: false);
      final reservationListProvider =
          Provider.of<ReservationListProvider>(parentContext, listen: false);
      await reservationListProvider.deleteReservation(
          authProvider.authenticatedClient!, reservation);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    } catch (exception) {
      print(exception);
      Toast.showFailToast('배차신청 취소에 실패했습니다.');
    }
  }
}
