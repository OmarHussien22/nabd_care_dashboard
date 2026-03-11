import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Adaptive/Picker/adaptive_picker.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final DateTime? initialTime;
  final Function(DateTime) onTimeSelected;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const CustomTimePicker({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.initialTime,
    required this.onTimeSelected,
    this.validator,
    this.prefixIcon = Icons.access_time,
  });

  @override
  Widget build(BuildContext context) {
    return AppFillTextFieldField(
      controller: controller,
      header: title,
      hint: hint,
      readOnly: true,
      prefixIconData: prefixIcon,
      onTap: () {
        AdaptivePicker.timePicker(
          context: context,
          title: title.toTr(),
          initial: initialTime ?? DateTime.now(),
          onConfirm: (date) {
            if (date != null) {
              controller.text = DateFormat('h:mm a').format(date);
              onTimeSelected(date);
            }
          },
        );
      },
      validation: validator,
    );
  }
}
