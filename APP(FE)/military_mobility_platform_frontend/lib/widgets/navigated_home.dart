import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/widgets/login/login.dart';
import 'package:provider/provider.dart';

class NavigatedHome extends StatefulWidget {
  const NavigatedHome({super.key});

  @override
  NavigatedHomeState createState() => NavigatedHomeState();
}

class NavigatedHomeState extends State<NavigatedHome> {
  @override
  void dispose() {
    Provider.of<NavigationProvider>(context).pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.isLoggedIn
        ? Scaffold(
            appBar: navigationProvider.currentTabAppBar,
            body: PageView(
              controller: navigationProvider.pageController,
              children: navigationProvider.tabWidgets,
            ),
            bottomNavigationBar: _buildNavigationBar(context))
        : const Scaffold(body: LoginTab());
  }

  Widget _buildNavigationBar(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navigationProvider.navigationBarOptions,
        currentIndex: navigationProvider.currentNavBarItemIdx,
        onTap: (index) => navigationProvider.animateToTabWithNavBarIdx(index));
  }
}
