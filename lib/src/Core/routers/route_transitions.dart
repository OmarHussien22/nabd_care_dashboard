import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TransitionType {
  material,
  cupertino,
  fade,
  scale,
  slide,
  rotation,
  size,
  rotationScale,
}

class RouteTransitions {
  static Route<dynamic> generate({
    required Widget page,
    required RouteSettings routeSettings,
    TransitionType transitionType = TransitionType.cupertino,
  }) {
    switch (transitionType) {
      case TransitionType.cupertino:
        return _cupertinoRoute(routeSettings, page);
      case TransitionType.fade:
        return _fadeRoute(routeSettings, page);
      case TransitionType.scale:
        return _scaleRoute(routeSettings, page);
      case TransitionType.slide:
        return _slideRoute(routeSettings, page);
      case TransitionType.rotation:
        return _rotationRoute(routeSettings, page);
      case TransitionType.size:
        return _sizeRoute(routeSettings, page);
      case TransitionType.rotationScale:
        return _rotationScaleRoute(routeSettings, page);
      case TransitionType.material:
      return MaterialPageRoute(
          builder: (context) => page,
          settings: routeSettings,
        );
    }
  }

  static PageRouteBuilder _cupertinoRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          linearTransition: true,
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _fadeRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _scaleRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _slideRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _rotationRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _sizeRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
    );
  }

  static PageRouteBuilder _rotationScaleRoute(
      RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
    );
  }
}