import 'package:flutter/cupertino.dart';
import '../../snap_interface.dart';
import '../named_routes.dart';
import 'Constants/imports_constants.dart';
import 'PageRouter/imports_page_router_builder.dart';
import 'Helper/Interfaces/helper_imports.dart';

extension SnapRouter on SnapInterface {
//<editor-fold desc="default">

  static final GoBuilder _pageRouter = GoBuilder();

  GoBuilder get pageRouter => _pageRouter;

//</editor-fold>

//<editor-fold desc="TO">
  Future<T?> to<T extends Object?>(
    Widget page, {
    TransitionType? transition,
    AnimationOption? options,
  }) {
    return key.currentState!.push<T>(_pageRouter.build(
      page,
      transition: transition,
      options: options,
    ));
  }

//</editor-fold>

//<editor-fold desc="TO NAMED">
  Future<T?> toNamed<T extends Object?>(
    NamedRoutes namedRoute, {
    Object? arguments,
  }) {
    return key.currentState!.pushNamed<T>(
      namedRoute.routeName,
      arguments: arguments,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF">
  // push named with transition
  Future<T?> off<T extends Object?, TO extends Object?>(
    Widget page, {
    TransitionType? transition,
    AnimationOption? options,
  }) {
    return key.currentState!.pushReplacement<T, TO>(_pageRouter.build(
      page,
      transition: transition,
      options: options,

    ));
  }

//</editor-fold>

//<editor-fold desc="OFF NAMED">
  // pushReplacement named
  Future<T?> offNamed<T extends Object?, TO extends Object?>(
    NamedRoutes namedRoute, {
    Object? arguments,
    TO? result,
  }) {
    return key.currentState!.pushReplacementNamed<T, TO>(
      namedRoute.routeName,
      arguments: arguments,
      result: result,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF ALL">
  // pushNamedAndRemoveUntil named with transition
  Future<T?> offAll<T extends Object?, TO extends Object?>(
    Widget page, {
    TransitionType? transition,
    AnimationOption? options,
  }) {
    return key.currentState!.pushAndRemoveUntil<T>(
      _pageRouter.build(
        page,
        transition: transition,
        options: options,
      ),
      (route) => false,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF ALL NAMED">
  // pushReplacement named with transition
  Future<T?> offAllNamed<T extends Object?>(
    NamedRoutes namedRoute, {
    Object? arguments,
  }) {
    return key.currentState!.pushNamedAndRemoveUntil<T>(
      namedRoute.routeName,
      (route) => false,
      arguments: arguments,
    );
  }

//</editor-fold>

//<editor-fold desc="back">

// back
  void back<T extends Object?>([T? result]) {
    if (canPop) {
      key.currentState!.pop(result);
    } else {
      key.currentState!.pop(result);
    }
  }

//</editor-fold>

//<editor-fold desc="pop">
  // can pop
  bool get canPop => key.currentState!.canPop();

  // may pop
  Future<bool> get mayPop => key.currentState!.maybePop();
//</editor-fold>
}
