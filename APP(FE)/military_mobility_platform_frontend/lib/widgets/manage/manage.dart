import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/appbar.dart';
import 'package:provider/provider.dart';

class ManageTab extends StatelessWidget {
  const ManageTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppBarProvider>(context, listen: false).setTitle('차량관리');
    });
    return const Center(child: Text('manage'));
  }
}
