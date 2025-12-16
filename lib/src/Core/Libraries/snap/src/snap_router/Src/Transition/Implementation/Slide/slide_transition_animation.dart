import 'package:care_desk/src/Core/Libraries/snap/src/snap_router/Src/Constants/imports_constants.dart';
import 'package:flutter/material.dart';

import '../../Factory/transition_creator.dart';
import 'Animator/slide_animator.dart';
import 'Option/slide_animation_option.dart';

class SlideTransitionAnimation implements TransitionCreator {
  final SlideAnimationOptions options;
  const SlideTransitionAnimation({required this.options});
  @override
  Widget animate(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: SliderAnimator(options).animator(animation),
      child: child,
    ).buildSecondaryTransition(
        animation: animation,
        applySecondaryTransition: options.secondaryTransition);
  }
}
