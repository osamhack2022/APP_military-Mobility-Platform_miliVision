import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';

class CancelRequestDialog extends StatelessWidget {
  const CancelRequestDialog(this.mobility, {super.key});

  final RequestedMobilityDTO mobility;

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

  void _cancelRequest(BuildContext context) {
    print('배차 신청 취소');
    Navigator.pop(context);
  }
}
