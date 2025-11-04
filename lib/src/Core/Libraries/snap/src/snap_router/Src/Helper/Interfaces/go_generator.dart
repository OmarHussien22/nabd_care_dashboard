
part of 'helper_imports.dart';

mixin NamedRouterInjector {
  NamedRoutes routerName(RouteSettings settings) {
    return NamedRoutes.values.firstWhere((e) => e.routeName == settings.name);
  }
}
abstract class GoGenerator with NamedRouterInjector {

  Route<dynamic> goRoutes (RouteSettings settings);

  Route<dynamic> undefineRoute();
}



