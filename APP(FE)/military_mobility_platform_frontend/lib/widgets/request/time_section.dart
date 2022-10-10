import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:military_mobility_platform_frontend/provider/mobility_request.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobilityRequestProvider =
        Provider.of<MobilityRequestProvider>(context);
    return Column(children: [
      const Text('이용시간'),
      Container(
          margin: const EdgeInsets.only(top: 10.0),
          height: 90.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFBDB8B8)),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _buildDateTimePicker(context,
                pattern: '대여 yyyy-MM-dd(E)',
                getter: () => mobilityRequestProvider.departureTime,
                setter: mobilityRequestProvider.setDepartureTime),
            _buildDateTimePicker(context,
                pattern: '반납 yyyy-MM-dd(E)',
                getter: () => mobilityRequestProvider.arrivalTime,
                setter: mobilityRequestProvider.setArrivalTime)
          ]))
    ]);
  }

  Widget _buildDateTimePicker(BuildContext context,
      {required String pattern,
      required DateTime Function() getter,
      required void Function(DateTime) setter}) {
    final theme = Theme.of(context);
    final format = DateFormat(pattern, 'ko_KR');
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Feedback.forTap(context);
          final now = DateTime.now();
          final minTime = now.subtract(Duration(minutes: now.minute));
          final maxTime = minTime.add(const Duration(days: 30));
          DatePicker.showDateTimePicker(context,
              showTitleActions: true,
              minTime: minTime,
              maxTime: maxTime,
              locale: LocaleType.ko,
              currentTime: getter(),
              onConfirm: (time) => setter(time));
        },
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(format.format(getter()), style: theme.textTheme.bodySmall),
          Row(children: [
            const Icon(Icons.access_time),
            Text(DateFormat.Hm('ko_KR').format(getter()))
          ])
        ]));
  }
}
