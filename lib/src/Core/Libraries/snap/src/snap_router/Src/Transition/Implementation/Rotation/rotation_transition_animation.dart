import 'package:care_desk/src/Core/Libraries/snap/src/snap_router/Src/Constants/imports_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Factory/transition_creator.dart';
import 'Animator/rotation_animator.dart';
import 'Option/rotation_animation_option.dart';

class RotationTransitionAnimation implements TransitionCreator {
  final RotationAnimationOptions options;

  const RotationTransitionAnimation({
    required this.options,
  });

  @override
  Widget animate(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    /// Primary animation

    return RotationTransition(
      turns: RotationAnimator(options).animator(animation),
      alignment: options.alignment,
      filterQuality: options.filterQuality,
      child: child,
    ).buildSecondaryTransition(
        animation: animation,
        applySecondaryTransition: options.secondaryTransition);
  }
}
