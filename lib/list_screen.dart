import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/app_router.dart';
import 'package:go_router_sample/detail_screen.dart';

class ListRoute extends GoRouteData {
  const ListRoute();

  // MEMO: 遷移時にBNBを非表示にする際は今回の場合pathに「/」不要、
  // parentNavigatorKeyにrootNavigatorKeyを指定
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
            onTap: () =>
                DetailRoute(title: item.title, $extra: item).go(context),
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
