import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router,
      );
}
