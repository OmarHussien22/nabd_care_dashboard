import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Decorations/app_shapes.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/navigation_extension.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Loading/loading.dart';

class AppDialogs {
  /// Enhanced Loading Dialog for a more premium look when sending requests
  static void showLoadingDialog({
    String? message,
    Widget? loading,
    bool isDismissible = false,
  }) {
    Get.dialog(
      PopScope(
        canPop: isDismissible,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.toW()),
              padding: EdgeInsets.all(24.toRad()),
              decoration: BoxDecoration(
                color: AppColors.get.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(24.toRad()),
                border: Border.all(
                  color: AppColors.get.white.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading ??
                      Loading.staggeredDotsWave(
                        color: AppColors.get.primary,
                        size: 50.toRad(),
                      ),
                  if (message != null) ...[
                    SizedBox(height: 20.toH()),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        message.toTr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.toFS(),
                          fontWeight: FontWeight.w600,
                          color: AppColors.get.textPrimary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: isDismissible,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeOutBack,
    );
  }

// static Future<void> showLoadingDialog(BuildContext context) async {
//   return showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) {
//       return Dialog(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               CircularProgressIndicator(),
//               SizedBox(width: 16),
//               Text('Loading...'),
//             ],
//           ),
//         ),
//
//       );
//     },
//   );
// }
  static void closeOpenDialogs() {
    /// close All open sheets and dialogs
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    // Navigator.of(context).pop();
  }

  static void showDialog({
    Widget? child,
    double? width,
    double? height,
    bool isDismissible = true,
    EdgeInsets insetPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
  }) {
    Get.dialog(
      Dialog(
        insetPadding: insetPadding,
        shape: AppShapes.dialogShape,
        backgroundColor: AppColors.get.white,
        child: SizedBox(
          width: width ?? Get.mediaQuery.size.width,
          height: height ?? Get.mediaQuery.size.height,
          child: child,
        ),
      ),
      transitionCurve: Curves.fastLinearToSlowEaseIn,
      barrierColor: const Color(0xff334444).withOpacity(0.9),
      barrierDismissible: isDismissible,
    );
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      String confirmLabel = 'confirm',
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
          ),
          // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "back".toTr(),
              ),
              onPressed: () => context.back(),
            ),
            CupertinoDialogAction(
              onPressed: confirm,
              child: Text(
                (confirmLabel).toTr(),
              ),
            ),
          ],
        );
      },
    );
  }

  ///change later
  static Future<void> showPreviewDialog({
    required Widget child,
    bool closeAfterAWhile = true,
    double? width,
    double? height,
    bool isDismissible = true,
    EdgeInsets insetPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
  }) async {
    await Utils.applyHapticFeedback();
    // await AudioService.play(audio_zoom_in);
    // play sound
    Get.dialog(
      Dialog(
        insetPadding: insetPadding,
        shape: AppShapes.dialogShape,
        backgroundColor: AppColors.get.white,
        child: SizedBox(
          width: width ?? Get.mediaQuery.size.width,
          height: height ?? Get.mediaQuery.size.height,
          child: child,
        ),
      ),
      transitionCurve: Curves.fastLinearToSlowEaseIn,
      barrierColor: const Color(0xff334444).withOpacity(0.9),
      barrierDismissible: isDismissible,
    );
    if (closeAfterAWhile) {
      Future.delayed(const Duration(milliseconds: 1500), () {}).then((_) async {
        if (Get.isDialogOpen!) {
          Get.back();
          // await AudioService.play(audio_zoom_out);
          Utils.applyHapticFeedback(vibration: true);
        }
      });
    }
  }
}
