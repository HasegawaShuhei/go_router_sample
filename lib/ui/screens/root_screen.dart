import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: [
          for (final item in NavBarItem.values) ...[
            NavigationDestination(
              icon: Icon(item.iconData),
              label: item.label,
            ),
          ],
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

enum NavBarItem {
  home,
  product,
  settings,
}

extension NavBarItemExt on NavBarItem {
  Icon get icon => Icon(iconData);

  IconData get iconData => switch (this) {
        NavBarItem.home => Icons.home,
        NavBarItem.product => Icons.devices,
        NavBarItem.settings => Icons.settings,
      };

  String get label => switch (this) {
        NavBarItem.home => 'Home',
        NavBarItem.product => 'Product',
        NavBarItem.settings => 'Settings',
      };
}
