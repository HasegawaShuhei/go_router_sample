import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';
import 'package:go_router_sample/ui/screens/list_screen.dart';

final homeNavigatorKey = GlobalKey<NavigatorState>();

class HomeBranch extends StatefulShellBranchData {
  static final $navigatorKey = homeNavigatorKey;
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('home'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => const ListRoute().go(context),
          child: const Text('to list'),
        )
      ],
    );
  }
}
