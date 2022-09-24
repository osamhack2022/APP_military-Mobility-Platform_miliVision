import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:provider/provider.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TitleProvider>(context, listen: false).setTitle('배차확인');
    });
    return const Center(child: Text('list'));
  }
}
