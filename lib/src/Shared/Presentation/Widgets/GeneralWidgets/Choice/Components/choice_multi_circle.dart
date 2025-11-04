import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

import '../../../Builders/conditional_builder.dart';

class ChoiceMultiCircle extends StatelessWidget {
  final bool isActive;

  const ChoiceMultiCircle({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isActive,
      onBuild: Container(
        width: 20.0.toW(),
        height: 20.0.toH(),
        decoration: BoxDecoration(
          color: AppColors.get.white,
          borderRadius: BorderRadius.circular(4.0.toRad()),
          border: Border.all(
            color: AppColors.get.secondary,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.check,
            size:16.toRad(),
            color: AppColors.get.secondary,
          ),
        ),
      ),
      onFeedBack: Container(
        width: 20.0.toW(),
        height: 20.0.toH(),
        decoration: BoxDecoration(
          color: AppColors.get.white,
          borderRadius: BorderRadius.circular(4.0.toRad()),
          border: Border.all(
            color: AppColors.get.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}