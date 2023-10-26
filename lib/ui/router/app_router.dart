import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/screens/detail_screen.dart';
import 'package:go_router_sample/ui/screens/home_screen.dart';
import 'package:go_router_sample/ui/screens/list_screen.dart';
import 'package:go_router_sample/ui/screens/login_screen.dart';
import 'package:go_router_sample/ui/screens/product_screen.dart';
import 'package:go_router_sample/ui/screens/root_screen.dart';
import 'package:go_router_sample/ui/screens/senttings_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<RootRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: HomeRoute.path,
          routes: [
            TypedGoRoute<ListRoute>(
              path: ListRoute.path,
              routes: [
                // ネストさせた場合はgoでも一覧画面がstackに含まれる
                TypedGoRoute<DetailRoute>(
                  path: DetailRoute.path,
                ),
              ],
            ),
            // この階層に置いた場合、pushだと一覧画面がstackに含まれるが
            // goだと一覧画面がstackから消える(同階層のため)
            // TypedGoRoute<DetailRoute>(
            //   path: DetailRoute.path,
            // ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ProductBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProductRoute>(
          path: ProductRoute.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingsRoute>(
          path: SettingsRoute.path,
        ),
      ],
    ),
  ],
)
class RootRoute extends StatefulShellRouteData {
  const RootRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return RootScreen(
      navigationShell: navigationShell,
    );
  }
}
