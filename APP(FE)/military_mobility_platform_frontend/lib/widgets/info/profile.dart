import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/user_info.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = Provider.of<UserInfoProvider>(context);
    final userImage = userInfoProvider.userImage;
    final userName = userInfoProvider.userName;
    final regiment = userInfoProvider.regiment;

    return Container(
        margin: EdgeInsets.only(left:30),
        child: Row(
            children: [
                userImage == null
                    ?Image.network(
                        'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                        )
                    :Image.file(Provider.of<UserInfoProvider>(context).userImage),
                const Padding(
                padding: EdgeInsets.only(left: 10.0)),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                        Text(Provider.of<UserInfoProvider>(context).userName, style: TextStyle(fontSize: 20.0)),
                        Text(Provider.of<UserInfoProvider>(context).regiment, style: TextStyle(fontSize: 14.0)),
                    ]
                )
            ]
        )
    );
  }
}