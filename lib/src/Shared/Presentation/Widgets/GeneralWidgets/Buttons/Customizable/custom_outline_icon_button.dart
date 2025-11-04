import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/Styles/Colors/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //padding: EdgeInsets.all(2.toW()),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.toW()),
          color: backgroundColor?? AppColors.get.white,
          border: Border.all(
            color: backgroundColor?? AppColors.get.greyLight,
            width: backgroundColor == null ? 1 : 0,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.get.grey,
            size: iconSize?? 18.toW(),
          ),
        ),
      ),
    );
  }
}
