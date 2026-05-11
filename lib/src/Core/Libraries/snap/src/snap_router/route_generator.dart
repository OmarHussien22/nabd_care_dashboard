import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/pages/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Libraries/snap/src/snap_router/named_routes.dart';

import 'Src/Constants/imports_constants.dart';
import 'Src/Helper/Interfaces/helper_imports.dart';
import 'Src/PageRouter/imports_page_router_builder.dart';

class RouterGenerator extends GoGenerator {
  @override
  Route<dynamic> goRoutes(RouteSettings settings) {
    final namedRoute = routerName(settings);
    // NamedRoutes.values.firstWhere((e) => e.routeName == settings.name);
    switch (namedRoute) {
      case NamedRoutes.home:
        return GoBuilder().build(
          const MainLayout(child: DashboardPage()),
          settings: settings,
          transition: TransitionType.fade,
        );

      case NamedRoutes.fourthPage:
        return GoBuilder().build(Container(), settings: settings);
    }
  }

  @override
  Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route exists here !'),
        ),
      ),
    );
  }
}
