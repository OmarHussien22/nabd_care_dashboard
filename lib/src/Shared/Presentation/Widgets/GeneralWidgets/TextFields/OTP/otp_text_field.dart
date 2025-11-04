import 'dart:async';

import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPFormField extends StatelessWidget {
  final int codeLength;
  final bool isObscure;
  final Function(String)? onCodeSelected;
  final Function(String)? onCodeChanged;
  final BuildContext context;

  final TextEditingController controller;
  final StreamController<ErrorAnimationType> errorController;

  const OTPFormField(
    this.context, {
    super.key,
    this.codeLength = 6,
    this.isObscure = false,
    this.onCodeSelected,
    this.onCodeChanged,
    required this.controller,
    required this.errorController,
  });

  // String smsCode = "";
  // var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext ctx) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: PinCodeTextField(
          appContext: context,
          enablePinAutofill: true,
          keyboardType: TextInputType.number,

          cursorColor: AppColors.get.secondary,
          length: codeLength,
          obscureText: isObscure,
          animationType: AnimationType.fade,
          // pastedTextStyle: ,
          obscuringCharacter: '*',
          textStyle: TextStyle(color: Colors.white),
          blinkWhenObscuring: isObscure ? true : false,
          pinTheme: PinTheme(
            borderWidth: 0.4,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: 50.toH(),
            fieldWidth: 40.toW(),
            activeFillColor: AppColors.get.secondary,
            disabledColor: Colors.grey,
            inactiveFillColor: Colors.grey.withOpacity(0.2),
            selectedFillColor: Colors.grey.withOpacity(0.12),
            errorBorderColor: Colors.redAccent.withOpacity(0.8),
            activeColor: Colors.black12,
            selectedColor: AppColors.get.secondary,
            inactiveColor: Colors.grey,
          ),
          animationDuration: const Duration(milliseconds: 300),
          validator: (v) {
            if (v!.length < codeLength) {
              return "short_code".tr;
            } else {
              return null;
            }
          },
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: controller,
          onCompleted: (value) {
            debugPrint("Completed");
            onCodeSelected!(value);
          },
          onChanged: (value) {
            // debugPrint(value);
            // setState(() {
            //   smsCode = value;
            onCodeChanged!(value);
            // });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
