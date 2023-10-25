import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/providers/auth.dart';

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

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('settings'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => ref.read(authProvider.notifier).logout(),
          child: const Text('logout'),
        )
      ],
    );
  }
}
