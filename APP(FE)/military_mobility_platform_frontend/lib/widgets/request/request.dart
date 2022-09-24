import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:provider/provider.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TitleProvider>(context, listen: false).setTitle('배차신청');
    });
    return const Center(child: Text('request'));
  }
}
