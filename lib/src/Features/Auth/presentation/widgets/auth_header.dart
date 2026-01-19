import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';

import '../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String appName;
  final String subTitle;

  const AuthHeader({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.appName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomText(
                    title,
                    fontSize: 10,
                    fontWeight: FW.bold,
                    color: AppColors.get.title,
                  ),
                  if (appName.isNotEmpty)
                    CustomText(
                      appName,
                      fontSize: 12,
                      fontWeight: FW.bold,
                      color: AppColors.get.primary,
                      padding: EdgeInsetsDirectional.only(start: 4.toW()),
                    ),
                ],
              ),
            ),
          ],
        ),
        8.ESH(),
        Row(
          children: [
            Expanded(
              child: CustomText.light(
                subTitle,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
