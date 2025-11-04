import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constants/Strings/app_strings.dart';
import '../GeneralWidgets/Text/custom_text_lib.dart';

class CardAppCredit extends StatelessWidget {
  const CardAppCredit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              'Made With ❤️ By Crazyidea',
              fontWeight: FW.regular,
              fontSize: 12,
            ),
          ],
        ),
        8.ESH(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              "${AppStrings.appAndroidVersion} اصدار التطبيق  ",
              fontWeight: FW.regular,
              fontSize: 11,
            ),
          ],
        ),
      ],
    );
  }
}
