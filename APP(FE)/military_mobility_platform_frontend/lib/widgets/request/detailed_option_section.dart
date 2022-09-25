import 'package:flutter/material.dart';

class DetailedOptionSection extends StatelessWidget {
  const DetailedOptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    const summary = '경유지 여부, 차량 공유 여부';
    return Column(children: const [
      Text('상세 옵션'),
      Padding(padding: EdgeInsets.only(top: 30.0), child: Text(summary)),
      Padding(
          padding: EdgeInsets.only(top: 15),
          child: IconButton(onPressed: null, icon: Icon(Icons.add))),
    ]);
  }
}
