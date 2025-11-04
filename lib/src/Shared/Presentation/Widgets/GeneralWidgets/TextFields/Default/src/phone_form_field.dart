import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';

import '../../../../../../../Core/Constants/Strings/Assets/app_icons.dart';
import '../../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../../Core/Utils/Validation/app_validator.dart';
import '../default_text_field.dart';

class PhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onCountryCodeChanged;
  final String? Function(String?)? validation;
  final Function()? onComplete;
  final String? header;
  final bool isEnabled;
  final bool hasCountryCode;

  const PhoneFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validation,
    this.onComplete,
    this.header,
    this.isEnabled = true,
    this.onCountryCodeChanged,
    this.hasCountryCode = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldDefault(
      width: 180,
      keyboardType: TextInputType.phone,
      header: TFFHeader(
        title: header ?? 'phone_number'.toTr(),
      ),
      hint: TFFHint(title: 'enter_phone_number'.toTr()),
      enable: isEnabled,
      controller: controller,
      onChanged: onChanged,
      validation: AppValidator.phoneValidator.validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      prefix: PrefixWithIconImage(
        iconImage: AppIcons.phone,
        scale: 4.5,
      ),
      suffix: hasCountryCode
          ? SuffixWithWidget(
              constraintsWidth: 100,
              constraintsHeight: 100,
              widget: CountryCodePicker(
                onChanged: (value) {
                  if (onCountryCodeChanged != null) {
                    onCountryCodeChanged!(value.dialCode ?? "");
                  }
                },
                initialSelection: 'EG',
                favorite: const [
                  '+20',
                  "+966",
                ],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
            )
          : const SuffixNone(),
      onComplete: onComplete,
      fillColor: AppColors.get.greyLight,
      inputDecoration: isEnabled
          ? InputDecorationWithBorder(
              enableBorderColor: AppColors.get.greyLight)
          : InputDecorationWithBorder(
              enableBorderColor: AppColors.get.greyLight,
              disableBorderColor: AppColors.get.greyLight,
            ),
    );
  }
}
