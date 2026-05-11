import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends NavigatorObserver {
  void _log(String event, Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final to = route?.settings.name ?? '<unknown>';
    final from = previousRoute?.settings.name ?? '<none>';
    printDM('[Route][$event] from: $from -> to: $to', name: 'AppRouteObserver');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('PUSH', route, previousRoute);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('POP', previousRoute, route);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _log('REPLACE', newRoute, oldRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log('REMOVE', previousRoute, route);
    super.didRemove(route, previousRoute);
  }
}

