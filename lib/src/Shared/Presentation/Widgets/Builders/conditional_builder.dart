import 'package:getx_base_code/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';


class GenericConditionalBuilder<T> {
  final bool condition;
  final T onBuild;
  final T onFeedBack;

  GenericConditionalBuilder({
    required this.condition,
    required this.onBuild,
    required this.onFeedBack,
  });

  T get build {
    if (condition) {
      return onBuild;
    } else {
      return onFeedBack;
    }
  }
}

class ConditionalBuilder extends StatelessWidget {
  final bool condition;
  final Widget onBuild;
  final Widget? onFeedBack;

  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.onBuild,
    this.onFeedBack,
  });

  // static void function({
  //   required bool condition,
  //   required VoidCallback onBuild,
  //   VoidCallback? onFeedBack,
  // }) {
  //   if (condition) {
  //     onBuild;
  //   } else {
  //     onFeedBack ?? () {};
  //   }
  // }
  //
  // T generic({
  //   required bool condition,
  //   required T onBuild,
  //   required T onFeedBack,
  // }) {
  //   if (condition) {
  //     return onBuild;
  //   } else {
  //     return onFeedBack;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var widgetIs;
    if (condition == true) {
      widgetIs = onBuild;
    } else {
      if(onFeedBack == null) {
        widgetIs= 0.ESH();
      }else{
      widgetIs = onFeedBack;
    }}
    return widgetIs;
  }
}
