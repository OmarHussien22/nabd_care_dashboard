import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class DesktopInput extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLines;

  const DesktopInput({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(label,
              fontSize: 13,
              fontWeight: FW.medium,
              color: AppPalette.textPrimary),
          const SizedBox(height: 6),
          // TextFormField(
          //   controller: controller,
          //   obscureText: isPassword,
          //   maxLines: maxLines,
          //   validator: validator,
          //   style: const TextStyle(fontSize: 14),
          //   decoration: InputDecoration(
          //     hintText: hint,
          //     prefixIcon: prefixIcon,
          //     suffixIcon: suffixIcon,
          //     // Styling is handled globally by Theme in themes.dart
          //   ),
          // ),
        ],
      ),
    );
  }
}
