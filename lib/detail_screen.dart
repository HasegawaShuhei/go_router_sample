import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/app_router.dart';
import 'package:go_router_sample/list_screen.dart';

class DetailRoute extends GoRouteData {
  const DetailRoute({
    required this.title,
    required this.$extra,
  });

  static const path = 'detail';

  static final $parentNavigatorKey = rootNavigatorKey;

  final String title;
  final Item $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailScreen(
      title: title,
      item: $extra,
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.title,
    required this.item,
  });

  final String title;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(title),
            Text(item.title),
          ],
        ));
  }
}
