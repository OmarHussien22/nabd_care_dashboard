// ignore_for_file: unused_import
import 'package:care_desk/src/Core/routers/go_router/app_go_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A service to track the navigation route stack using GetX.
/// It intelligently manages the stack based on whether a route is a primary sidebar route
/// or a sub-navigation page (like add/edit).
class NavigationService extends GetxController {
  NavigationService._();

  static final NavigationService instance = NavigationService._();  

  void push(String location, {Object? extra}) {
    AppGoRouter.push(location, extra: extra);
  }

  void replace(String location, {Object? extra}) {
    AppGoRouter.replace(location, extra: extra);
  }

  void go(String location, {Object? extra}) {
    AppGoRouter.go(location, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    AppGoRouter.pop(result);
  }
}

/// A breadcrumb-style widget that shows the navigation stack.
/// Tapping a previous route will navigate the user back to it.
class NavigationBreadcrumbs extends StatelessWidget {
  const NavigationBreadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// A navigator observer that automatically updates the [NavigationService]
/// whenever a route is pushed, popped, or replaced.
class NavigationStackObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
