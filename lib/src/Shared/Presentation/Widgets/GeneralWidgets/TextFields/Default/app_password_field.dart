import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Utils/Validation/Implementation/PasswordValidator/password_validator.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';

import '../../../../../../Core/Constants/Strings/Assets/app_icons.dart';
import '../../../../../../Core/Styles/Colors/app_colors.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    this.node,
    this.isRequired = false,
    this.validation,
    this.onComplete,
    this.hint = 'enter_password',
    this.headerText,
    this.width,
  });

  final TextEditingController controller;
  final FocusNode? node;
  final bool isRequired;
  final String? Function(String?)? validation;
  final Function()? onComplete;
  final String? hint;
  final String? headerText;
  final double? width;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldDefault(
      header: TFFHeader(
        title: (widget.headerText ?? 'password').toTr(),
      ),
      width: widget.width ?? 180,
      isRequired: false,
      controller: widget.controller,
      // prefix: PrefixWithIconImage(
      //   iconImage: AppIcons.password,
      //   scale: 4.5,
      // ),
      suffix: SuffixPassword(
        showPassword: isPasswordVisible,
        constraintsHeight: MediaQuery.of(context).size.height * .1,
        constraintsWidth: MediaQuery.of(context).size.width * .1,
        size: 20,
        onTap: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
          printDM('isPasswordVisible: $isPasswordVisible');
        },
      ),
      hint: TFFHint(
        title: widget.hint?.toTr(),
      ),
      fillColor: AppColors.get.greyLight,
      inputDecoration: InputDecorationWithBorder(
        enableBorderColor: AppColors.get.greyLight,
      ),
      validation: widget.validation ?? PasswordValidator.instance.validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onComplete: widget.onComplete,
    );
  }
}
