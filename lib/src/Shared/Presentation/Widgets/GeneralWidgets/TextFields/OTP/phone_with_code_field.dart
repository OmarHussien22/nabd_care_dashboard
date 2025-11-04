// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:getx_base_code/src/Core/Utils/validator_imp.dart';
// import 'package:getx_base_code/src/Ui/GeneralWidgets/TextFields/text_field_default.dart';
//
// class PhoneWithCodeFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String) onCountrySelect;
//   final Function(String)? onChanged;
//   final String? Function(String?)? validation;
//
//   const PhoneWithCodeFormField(
//     this.controller, {
//     Key? key,
//     required this.onCountrySelect, this.onChanged, this.validation,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20.0),
//       child: TextFieldDefault(
//         label: "enter_phone_number".tr,
//          hint: "enter_phone_number".tr,
//         keyboardType: TextInputType.number,
//         controller: controller,
//          validation: validation,
//          // validation: (value) =>
//          //    AppValidator.validate(value, type: ValidatorType.phone),
//    onChanged: onChanged,
//         prefixIcon: Transform.scale(
//           scale: 1.1,
//           child: RotatedBox(
//             quarterTurns: 0,
//             child: CountryCodePicker(
//               // padding: EdgeInsetsDirectional.only(start: 10.0),
//               onChanged: (code) {
//                 // debugPrint("${code.dialCode}" "${controller.text}");
//                 onCountrySelect(code.dialCode ?? "+20");
//               },
//               // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//               initialSelection: 'EG',
//               favorite: const ['+20', 'EG'],
//               // optional. Shows only country name and flag
//               showCountryOnly: false,
//               // optional. Shows only country name and flag when popup is closed.
//               showOnlyCountryWhenClosed: false,
//               // optional. aligns the flag and the Text left
//               alignLeft: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
