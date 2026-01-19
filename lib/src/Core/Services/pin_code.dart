import 'dart:async';

import 'package:care_desk/src/Core/Constants/strings/app_strings.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeServices {
  static pinCodeWidget(
      {Function? onChanged,
      int fieldCounts = 6,
      double fieldWidth = 55.0,
      required BuildContext context,
      TextEditingController? textEditingController,
      StreamController<ErrorAnimationType>? errorController}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.toH()),
        child: PinCodeTextField(
          enablePinAutofill: true,
          keyboardType: TextInputType.number,
          cursorColor: const Color(0xff4E70DB),
          appContext: context,
          length: fieldCounts,
          obscureText: false,
          pastedTextStyle: TextStyle(
              color: AppColors.get.title,
              fontSize: 15.sp,
              fontFamily: AppStrings.fontFamily),
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            inactiveColor: Colors.transparent,
            inactiveFillColor: const Color(0xffF3F4F6),
            // activeColor: Color(0xff4E70DB),
            activeColor: AppColors.get.primary,
            disabledColor: Colors.black,
            selectedFillColor: const Color(0xffF3F4F6),
            selectedColor: AppColors.get.primary,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12.r),
            fieldHeight: 55.toH(),
            fieldWidth: fieldWidth.toW(),
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          onCompleted: (v) {
            // debugPrint("Completed");
          },
          onChanged: (value) {
            // onChanged(value);
          },
          beforeTextPaste: (text) {
            // debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
