import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final settingsNavigatorKey = GlobalKey<NavigatorState>();

class SettingsBranch extends StatefulShellBranchData {
  static final $navigatorKey = settingsNavigatorKey;
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('settings'),
    );
  }
}
