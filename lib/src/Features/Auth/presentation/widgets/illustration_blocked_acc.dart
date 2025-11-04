import 'package:getx_base_code/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Illustrations/Builder/imports_illustration_builder.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Constants/Strings/assets.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/generic_image_lib.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/options/image_options.dart';

class IllustrationBlockedAcc extends StatelessWidget {
  const IllustrationBlockedAcc({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        IllustrationPageBuilder(
          title: "blocked_title".toTr(),
          body: "blocked_sub_title".toTr(),
          imageUrl: Assets.blocked,
        ),
        24.ESH(),
        Padding(
          padding: AppInsets.defaultScreenHorizontal,
          child: ButtonDefault(
            onPressed: () {
              // Helper.launcher.launchToWhatsApp(
              //     appStatusController.state.data?.whatsapp ?? "");
            },
            height: 60.toH(),
            color: const Color(0xff3FCC80),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.toW()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText("contact_with_whats".toTr(),
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FW.normal),
                  ),
                  71.ESW(),
                  ImageGeneric.asset(
                    url: Assets.whats,
                    options: const ImageOptions(
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        16.ESH(),
        Padding(
          padding: AppInsets.defaultScreenHorizontal,
          child: ButtonDefault(
            onPressed: () {
              // Helper.launcher
              //     .launchToPhone(appStatusController.state.data?.phone ?? "");
            },
            height: 60.toH(),
            color: Color(0xff5071EB),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.toW()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText("contact_with_phone".toTr(),
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FW.normal),
                  ),
                  71.ESW(),
                  ImageGeneric.asset(
                    url: Assets.phone,
                    options: ImageOptions(
                      height: 24.toH(),
                      width: 24.toW(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
