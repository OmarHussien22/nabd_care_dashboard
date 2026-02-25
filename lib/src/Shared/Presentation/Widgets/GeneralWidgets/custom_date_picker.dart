import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Adaptive/Picker/adaptive_picker.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime) onDateSelected;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const CustomDatePicker({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onDateSelected,
    this.validator,
    this.prefixIcon = Icons.calendar_today,
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
        AdaptivePicker.datePicker(
          context: context,
          title: title.toTr(),
          initial: initialDate ?? DateTime.now(),
          minDate: firstDate,
          maxDate: lastDate,
          onConfirm: (date) {
            if (date != null) {
              controller.text = DateFormat('yyyy-MM-dd').format(date);
              onDateSelected(date);
            }
          },
        );
      },
      validation: validator,
    );
  }
}
