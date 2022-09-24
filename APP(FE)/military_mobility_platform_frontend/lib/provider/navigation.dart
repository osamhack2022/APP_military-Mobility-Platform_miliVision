import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/widgets/info/info.dart';
import 'package:military_mobility_platform_frontend/widgets/list/list.dart';
import 'package:military_mobility_platform_frontend/widgets/manage/manage.dart';
import 'package:military_mobility_platform_frontend/widgets/request/request.dart';

class Tab {
  final String label;
  final IconData icon;
  final Widget Function() builder;
  Tab(this.label, this.icon, this.builder);
}

class NavigationProvider extends ChangeNotifier {
  static final _tabs = [
    Tab('배차신청', Icons.info, () => const RequestTab()),
    Tab('배차확인', Icons.info, () => const ListTab()),
    Tab('차량관리', Icons.info, () => const ManageTab()),
    Tab('내 정보', Icons.info, () => const InfoTab()),
  ];

  int _currentTabIdx = 0;

  int get currentTabIdx => _currentTabIdx;
  String get currentTabLabel => _tabs[_currentTabIdx].label;
  Widget Function() get currentTabBuilder => _tabs[_currentTabIdx].builder;
  List<BottomNavigationBarItem> get navigationBarOptions => _tabs
      .map((e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
          ))
      .toList();

  void changeTab(int tabIdx) {
    if (tabIdx < 0 || tabIdx >= _tabs.length) throw "tabidx out of range";
    _currentTabIdx = tabIdx;
    notifyListeners();
  }

  void changeTabWithName(String tabName) {
    var tabIdx = _tabs.indexWhere((element) => element.label == tabName);
    if (tabIdx < 0) throw "cannot find tab to change";
    _currentTabIdx = tabIdx;
    notifyListeners();
  }
}
