import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';

class ChoiceSingleCircle extends StatelessWidget {
  final bool isActive;
  final double height;
  final double width;

  const ChoiceSingleCircle({
    super.key,
    this.isActive = false,
    this.height = 15,
    this.width = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toH(),
      height: height.toH(),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          width: 1,
          color: AppColors.get.grey,
        ),
      ),
      child: isActive
          ? CircleAvatar(
              backgroundColor: AppColors.get.primary,
            )
          : 0.ESH(),
    );
  }
}
