import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/src/imports_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPendingSendRequestDevice extends StatelessWidget {
  const DialogPendingSendRequestDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200.toH(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.toW(),
            vertical: 25.toH(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              15.ESH(),
              const CustomText(
                "pending_send_request_device",
                textAlign: TextAlign.center,
                fontSize: 14,
              ),
              20.ESH(),
              Row(
                children: [
                  5.ESW(),
                  Expanded(
                    child: ButtonDefault(
                      title: "okay",
                      height: 50.toH(),
                      onPressed: () {
                        printDM("send request device is okay");
                        NavigationService.instance.pop();
                      },
                    ),
                  ),
                  5.ESW(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
