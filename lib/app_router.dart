import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/detail_screen.dart';
import 'package:go_router_sample/home_screen.dart';
import 'package:go_router_sample/list_screen.dart';
import 'package:go_router_sample/root_screen.dart';
import 'package:go_router_sample/senttings_screen.dart';

part 'app_router.g.dart';

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
