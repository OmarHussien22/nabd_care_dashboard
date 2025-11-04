import 'package:getx_base_code/src/Core/Constants/decorations/app_sizes.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Builders/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final Color _loadingColor = AppColors.get.primary;

/// Depends on loading_animation_widget  and flutter_spinkit Packages
class Loading extends StatelessWidget {
  final Widget? _customLoadingWidget;
  final bool isCentered;
  final Color? backgroundColor;

  const Loading._(
    this._customLoadingWidget, {
    super.key,
    this.isCentered = true,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isCentered,
      onBuild: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Center(
          child: _customLoadingWidget,
        ),
      ),
      onFeedBack: CircleAvatar(
        backgroundColor: backgroundColor,
        child: _customLoadingWidget,
      ),
    );
  }

  factory Loading.hourGlass({
    Color? color,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitHourGlass(
        color: color ?? _loadingColor,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.wanderingCubes({
    Color? color,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitWanderingCubes(
        color: color ?? _loadingColor,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.pouringHourGlass({
    Color? color,
    double size = AppSizes.loaderRadius,
    double strokeWidth = 1,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitPouringHourGlass(
        color: color ?? _loadingColor,
        size: size,
        duration: Duration(seconds: durationSeconds),
        strokeWidth: strokeWidth,
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.fadingCircle({
    Color? color,
    double size = AppSizes.loaderRadius,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      SpinKitFadingCircle(
        color: color ?? _loadingColor,
        size: size,
        duration: Duration(seconds: durationSeconds),
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.pulse({
    Color? color,
    double size = AppSizes.loaderRadius * 2,
    int durationSeconds = 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      Stack(
        alignment: Alignment.center,
        children: [
          SpinKitPulse(
            color: color ?? _loadingColor,
            duration: Duration(seconds: durationSeconds),
            size: size,
          ),
          CircleAvatar(
            backgroundColor: backgroundColor ?? _loadingColor,
            radius: 8,
          ),
        ],
      ),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  ///  ---------------------- loading_animation_widget --------------------------

  factory Loading.beat({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.beat(color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.bouncingBall({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.bouncingBall(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.discreteCircle({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.discreteCircle(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.stretchedDots({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.stretchedDots(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.hexagonDots({
    Color? color,
    double size = AppSizes.loaderRadius * 1,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.hexagonDots(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.twoRotatingArc({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.twoRotatingArc(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.fourRotatingDots({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.fourRotatingDots(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.staggeredDotsWave({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.staggeredDotsWave(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.inkDrop({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.inkDrop(color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.threeRotatingDots({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.threeRotatingDots(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  factory Loading.waveDots({
    Color? color,
    double size = AppSizes.loaderRadius,
    bool isCentered = true,
    Color? backgroundColor = Colors.transparent,
  }) {
    return Loading._(
      LoadingAnimationWidget.waveDots(
          color: color ?? _loadingColor, size: size),
      isCentered: isCentered,
      backgroundColor: backgroundColor,
    );
  }

  // /// ------------------ APP ------------------
  // factory Loading.main({
  //   Color color = AppColors.loaderColor,
  //   double size = AppSizes.loaderRadius,
  //   bool isCentered = true,
  //   Color? backgroundColor = Colors.transparent,
  // }) {
  //   return Loading._(
  //     LoadingAnimationWidget.waveDots(color: color, size: size),
  //     isCentered: isCentered,
  //     backgroundColor: backgroundColor,
  //   );
  // }
}
