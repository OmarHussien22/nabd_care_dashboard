import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedWrapper extends StatelessWidget {
  final WrapDurationStyle durationStyle;
  final Widget child;
  final int index;
  final WrapAnimationStyles styles;
  final Curve curve;
  final WrapOffsetStyle offsetStyle;

  final double offset;
  final FlipAxis flipAxis;

  const AnimatedWrapper({
    super.key,
    required this.child,
    this.index = 2,
    this.styles = WrapAnimationStyles.slide,
    this.offset = 100,
    this.curve = Curves.ease,
    this.flipAxis = FlipAxis.x,
    this.offsetStyle = WrapOffsetStyle.none,
    this.durationStyle = WrapDurationStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: _getAnimationDuration(durationStyle),
      child: _getAnimation(
        child: child,
        styles: styles,
        curve: curve,
        flipAxis: flipAxis,
        offsetStyle: offsetStyle,
        offset: offset,
      ),
    );
  }
}

enum WrapAnimationStyles { fade, slide, scale, flip }

enum WrapDurationStyle { veryFast, fast, normal, slow, verySlow, flash }

enum WrapOffsetStyle { vertical, horizontal, none, combination }

Duration _getAnimationDuration(WrapDurationStyle style) {
  switch (style) {
    case WrapDurationStyle.flash:
      // TODO: Handle this case.
      return const Duration(milliseconds: 20);
    case WrapDurationStyle.veryFast:
      // TODO: Handle this case.
      return const Duration(milliseconds: 150);
    case WrapDurationStyle.fast:
      // TODO: Handle this case.
      return const Duration(milliseconds: 375);
    case WrapDurationStyle.normal:
      // TODO: Handle this case.
      return const Duration(milliseconds: 450);
    case WrapDurationStyle.slow:
      // TODO: Handle this case.
      return const Duration(milliseconds: 750);
    case WrapDurationStyle.verySlow:
      // TODO: Handle this case.
      return const Duration(seconds: 1);
  }
}

Widget _getAnimation({
  WrapAnimationStyles styles = WrapAnimationStyles.slide,
  Curve curve = Curves.ease,
  WrapOffsetStyle offsetStyle = WrapOffsetStyle.none,
  FlipAxis flipAxis = FlipAxis.x,
  double offset = 100,
  required Widget child,
}) {
  Widget widget;
  switch (styles) {
    case WrapAnimationStyles.fade:
      widget = FadeInAnimation(
        curve: curve,
        child: child,
      );
      break;
    case WrapAnimationStyles.slide:
      switch (offsetStyle) {
        case WrapOffsetStyle.vertical:
          widget = SlideAnimation(
            verticalOffset: offset,
            curve: curve,
            child: FadeInAnimation(
              child: child,
            ),
          );
          break;
        case WrapOffsetStyle.horizontal:
          widget = SlideAnimation(
            horizontalOffset: offset,
            curve: curve,
            child: FadeInAnimation(
              child: child,
            ),
          );
          break;
        case WrapOffsetStyle.none:
          widget = SlideAnimation(
            curve: curve,
            child: FadeInAnimation(
              child: child,
            ),
          );
          break;
        case WrapOffsetStyle.combination:
          widget = SlideAnimation(
            curve: curve,
            verticalOffset: offset,
            horizontalOffset: offset,
            child: FadeInAnimation(
              child: child,
            ),
          );
          break;
      }
      break;
    case WrapAnimationStyles.scale:
      widget = ScaleAnimation(
        curve: curve,
        child: FadeInAnimation(
          child: child,
        ),
      );
      break;
    case WrapAnimationStyles.flip:
      widget = FlipAnimation(
        flipAxis: flipAxis,
        curve: curve,
        child: FadeInAnimation(
          child: child,
        ),
      );
      break;
  }
  return widget;
}
