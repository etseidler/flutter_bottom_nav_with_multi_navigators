// 1
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested_nav/bloc/simple_page.dart';

import 'nav/nav_state.dart';
import 'nav/simple_detail.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

// 2
class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Icon icon;
  final String pageText;
  final String titleText;
  TabNavigator({
    required this.navigatorKey,
    required this.icon,
    required this.pageText,
    required this.titleText,
  });

  // 3
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => SimplePage(
          text: pageText,
          title: titleText,
          icon: icon,
          onPush: () => _push(context)),
      TabNavigatorRoutes.detail: (context) => SimpleDetailPage(
            text: 'Simple Detail',
            title: 'Simple Detail Title',
          ),
    };
  }

  // 4
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }

  // 5
  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }
}
