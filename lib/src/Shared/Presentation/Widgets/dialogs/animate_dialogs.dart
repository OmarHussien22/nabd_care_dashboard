import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Dialogs {
  Dialogs._();
  static showSnackBar({
    String? title,
    required String bodyMessage,
    int status = 1,
    required BuildContext context,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(
            bodyMessage,
            color: AppColors.get.white,
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor:
              status == 1 ? AppColors.get.black : AppColors.get.red,
        ),
      );

  /// TODO : Animation Dialogs
  static customToast({
    required String text,
    required BuildContext context,
    required bool isSuccess,
    void Function()? onDismiss,
    Duration? duration,
  }) =>
      showToast(text,
          context: context,
          animation: StyledToastAnimation.slideFromTop,
          reverseAnimation: StyledToastAnimation.slideFromTop,
          position: StyledToastPosition.top,
          animDuration: const Duration(seconds: 1),
          duration: duration ?? const Duration(seconds: 3),
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.elasticInOut,
          onDismiss: onDismiss,
          backgroundColor:
              isSuccess ? AppColors.get.primary : AppColors.get.red,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSuccess ? AppColors.get.white : AppColors.get.white,
            ),
          ),
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: isSuccess ? AppColors.get.white : AppColors.get.white,
          ));

  //flutter pub add awesome_dialog
  // static warningDialog({
  //   required BuildContext context,
  //   required dynamic Function() cancelButton,
  //   required dynamic Function() confirmButton,
  //   String? title,
  //   String? desc,
  //   bool? dismissOnBackKeyPress,
  //   bool? dismissOnTouchOutside,
  //   DialogType? dialogType,
  //   Widget? body,
  // }) =>
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: dialogType ?? DialogType.error,
  //       animType: AnimType.bottomSlide,
  //       body: body,
  //       title: title ?? 'Title',
  //       desc: desc ?? 'do you want to confirm'.tr(),
  //       btnCancelOnPress: cancelButton,
  //       btnOkOnPress: confirmButton,
  //       dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
  //       dismissOnTouchOutside: dismissOnTouchOutside ?? true,
  //     ).show();show
}
