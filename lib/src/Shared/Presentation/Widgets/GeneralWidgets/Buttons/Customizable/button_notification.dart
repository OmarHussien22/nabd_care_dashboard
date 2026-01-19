import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/Constants/Strings/Assets/app_icons.dart';
import '../../../../../../Core/Libraries/snap/snap.dart';
import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../Image/generic_image/Src/generic_image_lib.dart';
import '../../Image/generic_image/Src/options/image_options.dart';

class ButtonNotification extends StatelessWidget {
  const ButtonNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Snap.to(const NotificationPage());
      },
      child: Padding(
        padding: EdgeInsets.all(12.0.toRad()),
        child: SizedBox(
          height: 24.toH(),
          width: 24.toW(),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Stack(
              children: [
                /// button
                ImageGeneric.asset(
                  url: AppIcons.notification,
                  options: const ImageOptions(
                    fit: BoxFit.contain,
                  ),
                ),

                /// badge
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    height: 6.toH(),
                    width: 6.toW(),
                    decoration: BoxDecoration(
                      color: AppColors.get.red,
                      borderRadius: BorderRadius.circular(8.toRad()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
