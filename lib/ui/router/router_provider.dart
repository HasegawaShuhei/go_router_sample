import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';
import 'package:go_router_sample/ui/router/guards/auth_route_guard.dart';
import 'package:go_router_sample/ui/router/refresh_listenable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final refreshListenable = ref.watch(refreshListenableProvider.notifier);
  final guards = [ref.watch(authRouteGuardProvider)];
  return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: kDebugMode,
      navigatorKey: rootNavigatorKey,
      routes: [...$appRoutes],
      refreshListenable: refreshListenable,
      redirect: (context, state) async {
        for (final guard in guards) {
          final String? result = await guard.canGo(context, state);
          if (result != null) return result;
        }
        return null;
      });
}
