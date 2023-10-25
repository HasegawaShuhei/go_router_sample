import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';

class DetailRoute extends GoRouteData {
  const DetailRoute({
    required this.title,
    // required this.$extra,
  });

  static const path = 'detail';

  static final $parentNavigatorKey = rootNavigatorKey;

  final String title;
  // オブジェクトを受け取る場合は$extraを使う
  // final Item $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailScreen(
      title: title,
      // item: $extra,
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
