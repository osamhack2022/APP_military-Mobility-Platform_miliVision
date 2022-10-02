import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/model/tab.dart';
import 'package:military_mobility_platform_frontend/widgets/info/info.dart';
import 'package:military_mobility_platform_frontend/widgets/list/list.dart';
import 'package:military_mobility_platform_frontend/widgets/manage/manage.dart';
import 'package:military_mobility_platform_frontend/widgets/request/request.dart';
import 'package:military_mobility_platform_frontend/widgets/request/select_mobility/select_mobility.dart';

const kDefaultAppBarLeading =
    IconButton(onPressed: null, icon: Icon(Icons.menu));

const kDefaultAppBarActions = [
  IconButton(onPressed: null, icon: Icon(Icons.notifications)),
  IconButton(onPressed: null, icon: Icon(Icons.share)),
  IconButton(onPressed: null, icon: Icon(Icons.search)),
];

final kTabs = [
  TabVO(
      name: 'request',
      builder: () => const RequestTab(),
      appbar: const AppBarVO(title: '배차신청'),
      navBarItem: const NavBarItemVO(label: '배차신청', icon: Icons.info)),
  TabVO(
    name: 'select mobility',
    appbar: const AppBarVO(title: '차량선택'),
    builder: () => SelectMobilityTab(),
  ),
  TabVO(
      name: 'list',
      builder: () => const ListTab(),
      appbar: const AppBarVO(title: '배차확인'),
      navBarItem: const NavBarItemVO(label: '배차확인', icon: Icons.info)),
  TabVO(
      name: 'manage',
      builder: () => const ManageTab(),
      appbar: const AppBarVO(title: '차량관리'),
      navBarItem: const NavBarItemVO(label: '차량관리', icon: Icons.info)),
  TabVO(
      name: 'info',
      builder: () => const InfoTab(),
      appbar: const AppBarVO(title: '내 정보'),
      navBarItem: const NavBarItemVO(label: '내 정보', icon: Icons.info)),
];
