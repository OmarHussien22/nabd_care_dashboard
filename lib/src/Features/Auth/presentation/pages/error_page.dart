import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Illustrations/imports_illustrations.dart';

import '../../../../Core/Constants/Decorations/app_Insets.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import '../manger/check_phone_verified_controller.dart';

class ErrorPage extends StatelessWidget {
  final bool isCheckPhoneRequired;
  const ErrorPage({super.key, this.isCheckPhoneRequired = false});

  @override
  Widget build(BuildContext context) {
    CheckPhoneVerifiedController checkPhoneVerifiedController =
        Get.put(CheckPhoneVerifiedController());
    return Scaffold(
        body: Padding(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: IllustrationUnKnownErrorScreen(),
          ),
          if (isCheckPhoneRequired == true) ...[
            ButtonDefault(
                title: "goto_app",
                height: 60.toH(),
                width: 200.toW(),
                backgroundColor: Colors.green,
                onPressed: () {
                  checkPhoneVerifiedController.checkPhoneVerified();
                }),
            24.ESH()
          ]
        ],
      ),
    ));
  }
}
