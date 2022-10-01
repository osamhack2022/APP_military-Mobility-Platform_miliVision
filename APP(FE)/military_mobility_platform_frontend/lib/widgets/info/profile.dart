import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/user_info.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = Provider.of<UserInfoProvider>(context);
    final userName = userInfoProvider.userName;
    final regiment = userInfoProvider.regiment;

    /*
    userInfoProvider.UserName('Seung Hyo Lee');
    userInfoProvider.Regiment('국군수송사령부');
    */

    return Container(
        child: Row(
            children: [
                Icon(Icons.person, size: 60),
                Column(
                    children: [
                        Text(userName, style: TextStyle(fontSize: 20.0)),
                        Text(regiment, style: TextStyle(fontSize: 10.0)),
                    ]
                )
            ]
        )
    );
  }
}