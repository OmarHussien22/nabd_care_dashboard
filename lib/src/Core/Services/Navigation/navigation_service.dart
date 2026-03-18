import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A service to track the navigation route stack using GetX.
/// It intelligently manages the stack based on whether a route is a primary sidebar route
/// or a sub-navigation page (like add/edit).
class NavigationService extends GetxController {
  static NavigationService get to => Get.find<NavigationService>();

  /// Regular list of route names in the navigation stack.
  final List<String> _routeStack = <String>[];

  /// List of routes that should be treated as "root" or sidebar pages.
  /// Navigating to these will reset the stack.
  final List<String> _sidebarRoutes = [
    AppRoutes.dashboard,
    AppRoutes.appointments,
    AppRoutes.patients,
    AppRoutes.settings,
  ];

  /// Returns the current route stack.
  List<String> get routeStack => List.unmodifiable(_routeStack);

  /// Push a route name to the stack.
  void pushRoute(String routeName) {
    // If it's a sidebar route, we clear the stack and start with this page
    if (_sidebarRoutes.contains(routeName)) {
      _routeStack.clear();
      _routeStack.add(routeName);
    } else {
      // For sub-pages, we only add if it's not already the top of the stack
      if (_routeStack.isEmpty || _routeStack.last != routeName) {
        _routeStack.add(routeName);
      }
    }
    debugPrint('🚦 NavigationStack: $_routeStack');
    update();
  }

  /// Remove the last route name from the stack.
  void popRoute() {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
      debugPrint('🚦 NavigationStack: $_routeStack');
      update();
    }
  }

  /// Returns the current active route name.
  String? get currentRoute => _routeStack.isNotEmpty ? _routeStack.last : null;

  /// Clears the entire route stack.
  void clearStack() {
    _routeStack.clear();
    update();
  }

  /// Navigates back or to a specific previous route keeping the sidebar visible.
  void navigateToRoute(String routeName) {
    int index = _routeStack.indexOf(routeName);
    if (index != -1 && index < _routeStack.length - 1) {
      int popCount = (_routeStack.length - 1) - index;
      for (int i = 0; i < popCount; i++) {
        dashboardNavigatorKey.currentState?.pop();
      }
    }
  }

  /// Map route names to readable display labels
  String getRouteLabel(String route) {
    switch (route) {
      case AppRoutes.dashboard:
        return 'Dashboard';
      case AppRoutes.appointments:
        return 'Appointments';
      case AppRoutes.patients:
        return 'Patients';
      case AppRoutes.addPatient:
        return 'Add Patient';
      case AppRoutes.settings:
        return 'Settings';
      default:
        // Fallback: clean up the route name
        return route.split('/').last.replaceAll('-', ' ').capitalizeFirst ??
            route;
    }
  }
}

/// A breadcrumb-style widget that shows the navigation stack.
/// Tapping a previous route will navigate the user back to it.
class NavigationBreadcrumbs extends StatelessWidget {
  const NavigationBreadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationService>(
      builder: (service) {
        if (service.routeStack.isEmpty) return const SizedBox.shrink();

        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: service.routeStack.asMap().entries.map((entry) {
                int idx = entry.key;
                String route = entry.value;
                bool isLast = idx == service.routeStack.length - 1;
                String label = service.getRouteLabel(route).toUpperCase();

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap:
                          isLast ? null : () => service.navigateToRoute(route),
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: isLast
                                ? Colors.teal.shade700
                                : Colors.grey.shade600,
                            fontWeight:
                                isLast ? FontWeight.w800 : FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 12,
                          color: Colors.grey.shade400,
                        ),
                        //  Text(
                        //   '>',
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       color: Colors.grey.shade400,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

/// A navigator observer that automatically updates the [NavigationService]
/// whenever a route is pushed, popped, or replaced.
class NavigationStackObserver extends GetObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (Get.isRegistered<NavigationService>()) {
      if (route.settings.name != null) {
        NavigationService.to.pushRoute(route.settings.name!);
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (Get.isRegistered<NavigationService>()) {
      NavigationService.to.popRoute();
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (Get.isRegistered<NavigationService>()) {
      NavigationService.to.popRoute();
      if (newRoute?.settings.name != null) {
        NavigationService.to.pushRoute(newRoute!.settings.name!);
      }
    }
  }
}
