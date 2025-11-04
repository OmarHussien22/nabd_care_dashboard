import 'package:flutter/material.dart';
import '../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../Core/utils/Extensions/screen_spaces_extension.dart';
import '../Spaces&Dividers/custom_divider.dart';

class SheetIndicator extends StatelessWidget {
  final double verticalSpacing;
  const SheetIndicator({super.key, this.verticalSpacing = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        XDivider.normal(
          color: AppColors.get.opposite,
          verticalPadding: verticalSpacing.toH(),
          horizontalPadding: 150.toW(),
        ),
        SizedBox(
          height: 5.toH(),
        ),
      ],
    );
  }
}
