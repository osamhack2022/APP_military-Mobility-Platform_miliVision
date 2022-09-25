import 'package:flutter/material.dart';

class DetailedOptionSection extends StatelessWidget {
  const DetailedOptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    const summary = '경유지 여부, 차량 공유 여부';
    final theme = Theme.of(context);
    return Column(children: [
      Text('상세 옵션', style: theme.textTheme.bodyMedium),
      Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(summary, style: theme.textTheme.bodyMedium)),
      const Padding(
          padding: EdgeInsets.only(top: 15),
          child: IconButton(onPressed: null, icon: Icon(Icons.add))),
    ]);
  }
}
