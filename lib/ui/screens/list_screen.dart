import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';
import 'package:go_router_sample/ui/screens/detail_screen.dart';

class ListRoute extends GoRouteData {
  const ListRoute();

  // parentNavigatorKeyにrootNavigatorKeyを指定してBNBを非表示
  // 遷移時もBNBを表示したい場合はそのroute用のNavigatorKeyを指定する
  static const path = 'list';

  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListScreen();
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  List<Item> get items =>
      List.generate(10, (index) => Item('title:${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return ListTile(
            // 引数を与えての遷移 [https://docs.page/csells/go_router/typed-routing#mixed-parameters]
            onTap: () => DetailRoute(id: index.toString()).go(context),
            title: Text(item.title),
          );
        },
      ),
    );
  }
}

class Item {
  Item(this.title);

  final String title;
}
