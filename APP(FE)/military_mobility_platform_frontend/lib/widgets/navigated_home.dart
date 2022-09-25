import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:provider/provider.dart';

class NavigatedHome extends StatelessWidget {
  const NavigatedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
        appBar: _buildAppBar(context),
        body: navigationProvider.currentTabBuilder(),
        bottomNavigationBar: _buildNavigationBar(context));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
        title: Consumer<TitleProvider>(
            builder: (context, value, child) => Text(value.title)),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
          IconButton(onPressed: null, icon: Icon(Icons.share)),
          IconButton(onPressed: null, icon: Icon(Icons.search)),
        ]);
  }

  Widget _buildNavigationBar(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navigationProvider.navigationBarOptions,
        currentIndex: navigationProvider.currentTabIdx,
        onTap: (index) => navigationProvider.changeTab(index));
  }
}
