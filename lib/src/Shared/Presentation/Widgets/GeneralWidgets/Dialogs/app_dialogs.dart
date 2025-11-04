import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Constants/Decorations/app_shapes.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/navigation_extension.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Core/Utils/utils.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Loading/loading.dart';

class AppDialogs {
  static void showLoadingDialog({
    Loading? loading,
    Color? color,
    bool isDark = false,
    bool isDismissible = false,
  }) {
    Get.dialog(
      Center(
        child: Dialog(
          shape: AppShapes.dialogShape,
          backgroundColor: color ?? (AppColors.get.main),
          elevation: 5,
          child: Container(
            // height: Get.mediaQuery.size.height * 0.12,
            // width: Get.mediaQuery.size.width * 0.1,
            padding: EdgeInsets.symmetric(vertical: 10.toH()),
            child:
                //TODO 7.b : change to loading widget
                loading ??
                    Loading.fadingCircle(size: 50, color: AppColors.get.grey),
            // Lottie.asset(Assets.lottieLoading,height: 80.toH(),width: 80.toW()),
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     loading ??
            //         Loading.fadingCircle(size: 50, color: AppColors.get.grey),
            //     YSpace.normal,
            //     SizedBox(
            //       // height: Get.mediaQuery.size.height * 0.08,
            //       child: DefaultTextStyle(
            //         style: TextStyle(
            //           fontSize: 12.0,
            //           color: AppColors.get.black,
            //           fontFamily: AppStrings.fontFamily,
            //         ),
            //         child: AnimatedTextKit(
            //           animatedTexts: [
            //             TypewriterAnimatedText('Loading',
            //                 speed: const Duration(milliseconds: 250),
            //                 textAlign: TextAlign.center),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          // insetPadding: const EdgeInsets.all(2.0),
        ),
      ),
      barrierDismissible: isDismissible,
      transitionCurve: Curves.fastLinearToSlowEaseIn,
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
    bool isDismissible = true,
    EdgeInsets insetPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
  }) {
    Get.dialog(
      AlertDialog(
        insetPadding: insetPadding,
        contentPadding: contentPadding,
        shape: AppShapes.dialogShape,
        backgroundColor: AppColors.get.white,
        content: SizedBox(
          width: width ?? Get.mediaQuery.size.width,
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
  }) async {
    await Utils.applyHapticFeedback();
    // await AudioService.play(audio_zoom_in);
    // play sound
    Get.dialog(
      child,
      transitionCurve: Curves.fastLinearToSlowEaseIn,
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
