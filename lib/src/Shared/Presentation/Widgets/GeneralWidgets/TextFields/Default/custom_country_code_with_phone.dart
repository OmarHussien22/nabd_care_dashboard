import 'package:country_code_picker/country_code_picker.dart';
import 'package:getx_base_code/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Validation/app_validator.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class CustomPhoneWithCountryKey extends StatelessWidget {
  final FocusScopeNode node;
  final TextEditingController textEditingController;
  final Function(String) onSelect;
  final Function()? onComplete;
  const CustomPhoneWithCountryKey({
    super.key,
    required this.node,
    required this.textEditingController,
    required this.onSelect,
    this.onComplete,
  });

  bool isEnglish() {
    // printDM(GetStorage().read('language'));
    return GetStorage().read('language') == 'english';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: (isEnglish()) ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          TextFieldDefault(
            prefix: PrefixWithIconImage(
              iconImage: AppIcons.call,
              // color: AppColors.get.primary,
              constraintsHeight: 26,
              constraintsWidth: 40,
            ),
            // suffix: SuffixWithIconImage(
            //   iconImage: AppIcons.call,
            //   color: AppColors.get.primary,
            //   constraintsHeight: 50,
            //   constraintsWidth: 50,
            // ),
            // suffix: _.suffixCheckPhone(),
            inputDecoration: InputDecorationWithBorder(
              enableBorderColor: AppColors.get.greyLight,
            ),
            hint: const TFFHint(
              title: 'phone_number',
            ),
            validation: AppValidator.phoneValidator.validate,
            keyboardType: TextInputType.phone,
            controller: textEditingController,
            onComplete: onComplete,
            onChanged: (value) {},
          ),

          CountryCodePicker(
            onChanged: (CountryCode countryCode) {
              printDM('CountryCodePicker onChanged: ${countryCode.dialCode}');
              onSelect(countryCode.dialCode!);
            },
            initialSelection: 'EG',
            favorite: const [
              '+20',
              '+966',
              '+971',
              '+974',
              '+973',
              '+968',
              '+965',
              '+962'
            ],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: false,
            showFlagDialog: true,
            showFlag: true,
            alignLeft: false,
            padding: const EdgeInsets.only(top: 22),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
            dialogTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          // CountryKeys(
          //   onSelect: (String countryKeySelected) {
          //     onSelect(countryKeySelected);
          //   },
          // ),
        ],
      ),
    );
  }
}
