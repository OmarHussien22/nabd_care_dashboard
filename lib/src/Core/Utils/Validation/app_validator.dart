import 'package:care_desk/src/Core/Utils/Validation/Implementation/DefaultValidator/default_validator.dart';
import 'package:care_desk/src/Core/Utils/Validation/Implementation/NoneValidator/none_validator.dart';
import 'package:care_desk/src/Core/Utils/Validation/Implementation/PasswordValidator/password_validator.dart';
import 'package:care_desk/src/Core/Utils/Validation/Implementation/PhoneValidator/phone_validator.dart';
import 'package:flutter/material.dart';

import 'Implementation/AgeValidator/age_validator.dart';
import 'Implementation/EmailValidator/email_validator.dart';
import 'Implementation/NumberValidator/number_validator.dart';

void formValidator(
    {required GlobalKey<FormState> globalKey,
    required VoidCallback onSuccessValidate,
    VoidCallback? onFailedValidate}) {
  if (globalKey.currentState!.validate()) {
    globalKey.currentState!.save();
    onSuccessValidate();
  } else {
    if (onFailedValidate != null) {
      onFailedValidate();
    }
  }
}

class AppValidator {
  AppValidator._();

  static NoneValidator get noneValidator => NoneValidator.instance;

  static PhoneValidator get phoneValidator => PhoneValidator.instance;
  static NumberValidator get numberValidator => NumberValidator.instance;

  static AgeValidator get ageValidator => AgeValidator.instance;

  static PasswordValidator get passwordValidator => PasswordValidator.instance;

  static DefaultValidator get defaultValidator => DefaultValidator.instance;

  static EmailValidator get emailValidator => EmailValidator.instance;
}
