import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';

import '../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        17.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              "dont_have_account",
              color: AppColors.get.title,
              // fontSize: 14,
            ),

            2.ESW(),
            InkWell(
              onTap: () {
                NavigationService.instance.go('/register');
              },
              child: CustomText(
                "create_account",
                color: AppColors.get.primary,
                // fontSize: 14,
              ),
            ),
          ],
        ),
        // 17.ESH(),
      ],
    );
  }
}
