part of 'imports_page_router_builder.dart';

/// PageRouterBuilder
class GoBuilder {
  GoBuilder._();

  factory GoBuilder() => _instance;
  static final GoBuilder _instance = GoBuilder._();

  PageRouterCreator _creator = CustomPageRouterCreator();

  void initAppRouter({
    PlatformConfig? config,
  }) {
    ///TODO: Set Named Routes for the app

    final platform = Platform.operatingSystem;
    switch (platform) {
      case 'android':
        // _creator = config?.android ?? MaterialPageRouterCreator();
        _creator = config?.android ?? CustomPageRouterCreator(parentTransition: TransitionType.cupertino);
        break;
      case 'ios':
        _creator = config?.ios ?? CupertinoPageRouterCreator();
        break;
      case 'windows':
        _creator = config?.web ??
            CustomPageRouterCreator(parentTransition: TransitionType.fade);
        break;
      default:
        _creator = CupertinoPageRouterCreator();
    }
  }

  Route<T> build<T>(
    Widget page, {
    RouteSettings? settings,
    TransitionType? transition,
    AnimationOption? options,

    ///TODO : DO ALL THE Assert OPTIONS
  }) {
    return _creator.create<T>(
      page,
      settings: settings,
      transition: transition,
      animationOptions: options,
    );
  }
}

class PlatformConfig {
  final PageRouterCreator? android;
  final PageRouterCreator? ios;
  final PageRouterCreator? web;
  PlatformConfig({
    this.android,
    this.ios,
    this.web,
  });
}
