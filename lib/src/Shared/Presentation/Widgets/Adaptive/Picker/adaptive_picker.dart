import 'dart:io';

import 'package:care_desk/src/Core/Constants/strings/app_strings.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/navigation_extension.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

/// NOT HANDLED IN DARK MODE

class AdaptivePicker {
  static datePicker({
    required BuildContext context,
    required Function(DateTime? date) onConfirm,
    required String title,
    DateTime? initial,
    DateTime? minDate,
  }) async {
    if (getOS == ios) {
      _iosDatePicker(context, onConfirm, title,
          initial: initial, minDate: minDate);
    } else {
      _androidDatePicker(context, onConfirm,
          initial: initial, minDate: minDate);
    }
  }

  static _androidDatePicker(
      BuildContext context, Function(DateTime? date) onConfirm,
      {DateTime? initial, DateTime? minDate}) {
    showRoundedDatePicker(
        context: context,
        initialDate: initial ?? DateTime.now(),
        firstDate: minDate ?? DateTime.now().add(const Duration(days: -1)),
        lastDate: DateTime(2050),
        borderRadius: 16,
        height: 300,
        styleDatePicker: MaterialRoundedDatePickerStyle(),
        theme: ThemeData.light().copyWith(
          primaryColor: AppColors.get.primary,
          hintColor: Colors.black,
          // backgroundColor: AppColors.get.white,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        )).then(onConfirm);
  }

  static _iosDatePicker(
      BuildContext context, Function(DateTime? date) onConfirm, String title,
      {DateTime? initial, DateTime? minDate}) {
    _bottomSheet(
      context: context,
      child: cupertinoDatePicker(context,
          initial: initial,
          minDate: minDate,
          title: title,
          onConfirm: onConfirm),
    );
  }

  static Widget cupertinoDatePicker(
    BuildContext context, {
    required String title,
    String? onConfirmLabel,
    required Function(DateTime? date) onConfirm,
    DateTime? initial,
    DateTime? minDate,
    DateTime? maxDate,
    int? maximumYear,
    int minimumYear = 1,
  }) {
    DateTime date = DateTime.now();
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      color: AppColors.get.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.get.icon,
                  ),
                ),
                CustomText(
                  title,
                  color: AppColors.get.title,
                  fontSize: 16,
                  isBold: true,
                ),
                TextButton(
                  onPressed: () {
                    onConfirm(date);
                    context.back();
                  },
                  child: CustomText(
                    onConfirmLabel ?? "done",
                    fontSize: 14,
                    color: AppColors.get.primary,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: CupertinoTheme(
              data: CupertinoThemeData(
                primaryColor: AppColors.get.primary,
                primaryContrastingColor: AppColors.get.primary,
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                      color: AppColors.get.primary,
                      fontSize: 18.toFS(),
                      fontWeight: FontWeight.w600),
                ),
              ),
              child: CupertinoDatePicker(
                backgroundColor: AppColors.get.activeBackground,
                initialDateTime: initial ?? DateTime.now(),
                onDateTimeChanged: (date) {
                  date = date;
                  debugPrint("date is => $date");
                },
                minimumDate:
                    minDate ?? DateTime.now().add(const Duration(days: -1)),
                mode: CupertinoDatePickerMode.date,
                maximumDate: maxDate,
                minimumYear: minimumYear,
                maximumYear: maximumYear,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static timePicker(
      {required BuildContext context,
      required String title,
      required DateTime initial,
      required Function(DateTime? date) onConfirm}) async {
    if (Platform.isIOS) {
      _iosTimePicker(context, title, onConfirm, initial);
    } else {
      _androidTimePicker(context, onConfirm);
    }
  }

  static _androidTimePicker(
      BuildContext context, Function(DateTime date) onConfirm) {
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      theme: ThemeData(
        primaryColor: AppColors.get.primary,
        hintColor: Colors.black,
        // backgroundColor: AppColors.get.white,
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      initialTime: TimeOfDay.now(),
    ).then((time) => onConfirm(
        DateTime(now.year, now.month, now.day, time!.hour, time.minute)));
  }

  static _iosTimePicker(BuildContext context, String title,
      Function(DateTime? date) onConfirm, DateTime initial) {
    _bottomSheet(
      context: context,
      child: cupertinoTimePicker(context, title,
          onConfirm: onConfirm, initial: initial),
    );
  }

  static Widget cupertinoTimePicker(BuildContext context, String title,
      {required Function(DateTime? date) onConfirm,
      required DateTime initial}) {
    DateTime date = DateTime.now();
    return Container(
      color: AppColors.get.background,
      height: 260.h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CloseButton(),
                CustomText(
                  title,
                  fontWeight: FW.semiBold,
                  padding: const EdgeInsetsDirectional.only(end: 0.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    onConfirm(date);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(elevation: 0),
                  child: CustomText(
                    "done".tr,
                    fontSize: 14,
                    color: AppColors.get.white,
                  ),
                ),
              ],
            ),
          ),
          XDivider.normal(verticalPadding: 5.0.h),
          Flexible(
              child: CupertinoDatePicker(
            initialDateTime: initial,
            onDateTimeChanged: (date) {
              date = date;
            },
            mode: CupertinoDatePickerMode.time,
          )),
        ],
      ),
    );
  }

  static _bottomSheet({required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
        height: 320,
        child: child,
      ),
    );
  }
}
