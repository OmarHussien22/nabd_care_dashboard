import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/render_interface.dart';
import 'package:flutter/material.dart';

abstract class SuffixImp extends RenderInterface {
  final String? title;
  final String? iconImage;
  final IconData? iconData;
  final Color? color;
  final double? size;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? scale;
  final double? constraintsHeight;
  final double? constraintsWidth;

  const SuffixImp(
      {this.title,
      this.constraintsHeight,
      this.constraintsWidth,
      this.onTap,
      this.iconImage,
      this.iconData,
      this.color,
      this.size,
      this.widget,
      this.fontSize,
      this.fontWeight,
      this.scale});

  BoxConstraints? get getBoxConstraints {
    return BoxConstraints(
      maxHeight: constraintsHeight!.toH(),
      maxWidth: constraintsWidth!.toW(),
    );
  }
}
