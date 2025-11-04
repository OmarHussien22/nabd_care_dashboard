// part of 'imports_parts.dart';

import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter/material.dart';

TooltipThemeData getTooltipTheme() => TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.get.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      enableFeedback: true,
      textStyle: TextStyle(
        color: AppColors.get.title,
      ),
    );
