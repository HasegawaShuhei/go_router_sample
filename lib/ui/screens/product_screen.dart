import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/ui/router/app_router.dart';

final productNavigatorKey = GlobalKey<NavigatorState>();

class ProductBranch extends StatefulShellBranchData {
  static final $navigatorKey = productNavigatorKey;
}

class ProductRoute extends GoRouteData {
  const ProductRoute({this.device});

  static const path = '/product';

  final Device? device;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductScreen(
      device: device ?? Device.phone,
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

late TabController _tabController;

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  VoidCallback get _onChangeTab => () {
        if (_tabController.indexIsChanging) {
          return;
        }

        final device = Device.values[_tabController.index];
        ProductRoute(device: device).go(context);
      };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: Device.values.length,
      initialIndex: widget.device.index,
    )..addListener(_onChangeTab);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onChangeTab);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            for (final device in Device.values) ...[
              Tab(
                child: Text(
                  device.label,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              for (final device in Device.values) ...[
                Center(child: Text(device.label)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

enum Device {
  phone('phone'),
  tablet('tablet'),
  laptop('laptop'),
  ;

  const Device(this.label);

  final String label;
}
