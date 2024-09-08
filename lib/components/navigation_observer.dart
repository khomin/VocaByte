import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class NavigatorObserverCustom extends NavigatorObserver {
  NavigatorObserverCustom({required this.onChanged});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logDebug(
        'navigator didPush: ${route.settings.name},   prev = ${previousRoute?.settings.name}');
    _parse(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logDebug(
        'navigator didPop: ${route.settings.name},   prev = ${previousRoute?.settings.name}');
    if (previousRoute != null) {
      _parse(previousRoute);
    }
  }

  void _parse(Route route) {
    if (route.settings.name != null) {
      // var name = route.settings.name?.replaceAll('/', '');
      // var found = PagesType.values.firstWhereOrNull((it) => name == it.name);
      // if (found != null) {
      //   onChanged(found);
      // } else {
      //   onChanged(PagesType.none);
      // }
      onChanged(route.settings.name ?? '');
    }
  }

  final Function(String pageName) onChanged;
}
