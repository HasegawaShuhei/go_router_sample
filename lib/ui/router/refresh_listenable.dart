import 'package:flutter/material.dart';
import 'package:go_router_sample/ui/providers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_listenable.g.dart';

@riverpod
class RefreshListenable extends _$RefreshListenable implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<void> build() async {
    ref.listen(authProvider, (_, __) {
      routerListener?.call();
    });
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
