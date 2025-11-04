import '../../Image/generic_image/Src/generic_image_lib.dart';
import '../../Image/generic_image/Src/options/image_options.dart';
import '../../Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/constants/decorations/app_sizes.dart';
import '../../../../../../Core/utils/Extensions/screen_spaces_extension.dart';

import 'base_button.dart';

enum ButtonStyle { withBorder, withOutBorder }

class OldButtonDefault extends StatelessWidget {
  final String title;
  final String iconImage;
  final Color? buttonColor;
  final Color? disActiveButtonColor;

  final Color? titleColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final double radius;
  final double titleSize;
  final double iconHeight;
  final Color? borderColor;
  final Color? disActiveBorderColor;
  final bool? active;
  final Widget? child;

  const OldButtonDefault(
      {super.key,
      this.child ,
      this.borderColor,
      this.disActiveButtonColor,
      //= AppColors.get.d,
      this.disActiveBorderColor, // = AppColors.buttonDisabled,
      this.titleSize = 14,
      this.iconHeight = 12,
      this.radius = AppSizes.radius,
      this.title = '',
      this.iconImage = '',
      this.buttonColor,
      this.titleColor = Colors.white,
      this.iconColor = Colors.white,
      this.onTap,
      this.height = 60,
      this.width = 343,
      this.active = true});

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      height: height.toH(),
      width: width.toW(),
      radius: radius.r,
      borderColor: active! ? borderColor : disActiveBorderColor,
      buttonColor: active! ? buttonColor : disActiveButtonColor,
      onTap: onTap,
      child: child ?? drawChild(),
    );
  }

  Widget drawChild() {
    if (title.isNotEmpty && iconImage.isEmpty) {
      //  return text only
      return Center(
        child: CustomText(
          title,
          color: titleColor ?? Colors.white,
          fontSize: titleSize,
          fontWeight: FW.medium,
        ),
      );
    } else if (title.isEmpty && iconImage.isNotEmpty) {
      //  return icon only
      return Center(
        child: ImageGeneric.asset(
          url: 'assets/icons/$iconImage',
          options: ImageOptions(
            color: iconColor,
            height: iconHeight,
          ),
        ),
      );
    } else if (title.isNotEmpty && iconImage.isNotEmpty) {
      //  return icon and text
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              title,
              color: titleColor ?? Colors.white,
              fontSize: titleSize,
              fontWeight: FW.medium,
            ),
            7.0.ESW(),
            ImageGeneric.asset(
              url: 'assets/icons/$iconImage',
              options: ImageOptions(
                color: iconColor ?? Colors.white,
                height: iconHeight,
              ),
            ),
          ],
        ),
      );
    } else {
      //  return text only
      return Center(
        child: CustomText(
          title,
          color: titleColor ?? Colors.white,
          fontSize: titleSize,
          fontWeight: FW.light,
        ),
      );
    }
  }
}
