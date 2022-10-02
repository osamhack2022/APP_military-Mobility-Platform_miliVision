import 'package:flutter/material.dart';

class NavBarItemVO {
  final String label;
  final IconData icon;
  const NavBarItemVO({required this.label, required this.icon});
}

class AppBarVO {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const AppBarVO({required this.title, this.leading, this.actions});
}

class TabVO {
  final String name;
  final Widget Function() builder;
  final AppBarVO appbar;
  final NavBarItemVO? navBarItem;
  const TabVO(
      {required this.name,
      required this.builder,
      required this.appbar,
      this.navBarItem});
}
