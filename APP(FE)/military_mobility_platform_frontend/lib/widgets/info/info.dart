import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/constatns/theme.dart';
import 'package:military_mobility_platform_frontend/widgets/info/profile.dart';
import 'package:military_mobility_platform_frontend/widgets/info/info_menu.dart';
import 'package:military_mobility_platform_frontend/provider/user_info.dart';
import 'package:military_mobility_platform_frontend/provider/appbar.dart';
import 'package:provider/provider.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppBarProvider>(context, listen: false).setTitle('내 정보');
    });
    return ChangeNotifierProvider(
      create: (context) => UserInfoProvider(),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 80.0)),
          const Profile(),
          const Padding(
                padding: EdgeInsets.only(bottom: 30.0)),
          const InfoMenu(),
        ],
      ),
    );
  }
}
