import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/drive_info.dart';
import 'package:military_mobility_platform_frontend/service/snackbar.dart';
import 'package:military_mobility_platform_frontend/widgets/drive/drive.dart';
import 'package:military_mobility_platform_frontend/model/tab.dart';
import 'package:military_mobility_platform_frontend/provider/reservation_list.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/widgets/list/detailed_info/detailed_info.dart';
import 'package:military_mobility_platform_frontend/widgets/list/list.dart';
import 'package:military_mobility_platform_frontend/widgets/manage/manage.dart';
import 'package:military_mobility_platform_frontend/widgets/request/request.dart';
import 'package:military_mobility_platform_frontend/widgets/request/select_mobility/select_mobility.dart';
import 'package:provider/provider.dart';

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
    appbar: AppBarVO(
        title: '차량선택',
        leading: (context) => IconButton(
            onPressed: () =>
                Provider.of<NavigationProvider>(context, listen: false)
                    .animateToTabWithName('request'),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: (_) => []),
    builder: () => const SelectMobilityTab(),
  ),
  TabVO(
      name: 'list',
      builder: () => const ListTab(),
      appbar: const AppBarVO(title: '배차확인'),
      navBarItem: const NavBarItemVO(label: '배차확인', icon: Icons.info)),
  TabVO(
      name: 'detailed info',
      appbar: AppBarVO(
          title: '상세정보',
          leading: (context) => IconButton(
              onPressed: () {
                Provider.of<ReservationListProvider>(context, listen: false)
                    .deselect();
                Provider.of<NavigationProvider>(context, listen: false)
                    .animateToTabWithName('list');
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: (_) => []),
      builder: () => const DetailedInfoTab(),
      floatingButton: (context) => FloatingActionButton(
          elevation: 2.0,
          onPressed: (() async {
            try {
              final driveInfoProvider =
                  Provider.of<DriveInfoProvider>(context, listen: false);
              final navigationProvider =
                  Provider.of<NavigationProvider>(context, listen: false);
              await driveInfoProvider.startDriveMock();
              navigationProvider.animateToTabWithName('drive');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Snackbar(context).showInfo('운행을 시작합니다.');
              });
            } catch (exception) {
              print(exception.toString());
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Snackbar(context).showError('운행을 시작할 수 없습니다.');
              });
            }
          }),
          child: const Icon(Icons.play_arrow))),
  TabVO(
      name: 'manage',
      builder: () => const ManageTab(),
      appbar: const AppBarVO(title: '차량관리'),
      navBarItem: const NavBarItemVO(label: '차량관리', icon: Icons.info)),
  TabVO(
      name: 'drive',
      builder: () => const DriveTab(),
      appbar: const AppBarVO(title: '운행시작'),
      navBarItem: const NavBarItemVO(label: '운행시작', icon: Icons.info)),
];
