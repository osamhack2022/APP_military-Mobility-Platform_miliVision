import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/navigation.dart';
import 'package:military_mobility_platform_frontend/provider/title.dart';
import 'package:provider/provider.dart';

class NavigatedHome extends StatelessWidget {
  NavigatedHome({super.key});

  late NavigationProvider _navigationProvider;
  @override
  Widget build(BuildContext context) {
    _navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
        appBar: _buildAppBar(context),
        body: _navigationProvider.currentTabBuilder(),
        bottomNavigationBar: _buildNavigationBar(context));
  }

  AppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
      title: Consumer<TitleProvider>(
          builder: (context, value, child) =>
              Text(value.title, style: theme.textTheme.titleMedium)),
      actions: const [
        IconButton(onPressed: null, icon: Icon(Icons.notifications)),
        IconButton(onPressed: null, icon: Icon(Icons.share)),
        IconButton(onPressed: null, icon: Icon(Icons.search)),
      ],
      backgroundColor: theme.appBarTheme.backgroundColor,
      iconTheme: theme.appBarTheme.iconTheme,
      actionsIconTheme: theme.appBarTheme.actionsIconTheme,
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _navigationProvider.navigationBarOptions,
        currentIndex: _navigationProvider.currentTabIdx,
        selectedItemColor: theme.selectedItemColor,
        unselectedItemColor: theme.unselectedItemColor,
        backgroundColor: theme.backgroundColor,
        onTap: (index) => _navigationProvider.changeTab(index));
  }
}
