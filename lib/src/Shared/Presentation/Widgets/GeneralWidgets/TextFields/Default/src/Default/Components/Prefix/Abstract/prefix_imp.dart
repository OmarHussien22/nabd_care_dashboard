import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/render_interface.dart';
import 'package:flutter/material.dart';

abstract class PrefixImp extends RenderInterface {
  final String? title;
  final String? iconImage;
  final IconData? iconData;
  final Color? color;
  final double? size;
  final double? fontSize;
  final double? scale;
  final FontWeight? fontWeight;
  final Widget? widget;
  final double? constraintsHeight;
  final double? constraintsWidth;
  const PrefixImp({
    this.title,
    this.scale,
    this.constraintsHeight,
    this.constraintsWidth,
    this.iconImage,
    this.iconData,
    this.color,
    this.size,
    this.widget,
    this.fontSize,
    this.fontWeight,
  });

  BoxConstraints? get getBoxConstraints {
    return (constraintsHeight != null && constraintsWidth != null)
        ? BoxConstraints(
            maxHeight: (constraintsHeight)!.toH(),
            maxWidth: (constraintsWidth)!.toW(),
          )
        : null;
  }
}
