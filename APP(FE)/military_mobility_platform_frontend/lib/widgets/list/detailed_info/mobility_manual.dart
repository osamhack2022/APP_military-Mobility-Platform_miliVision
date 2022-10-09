import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:military_mobility_platform_frontend/model/mobility.dart';
import 'package:military_mobility_platform_frontend/service/mobility_assets.dart';

class MobilityManual extends StatelessWidget {
  const MobilityManual(this.mobility, {super.key});

  final int mobility;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MobilityAssets.getMobilityManual('type 임시'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  Icon(Icons.error, size: 50.0),
                  Text('로딩 중 에러가 발생했습니다.')
                ]));
          } else {
            return Markdown(data: snapshot.data!);
          }
        });
  }
}
