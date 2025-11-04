import 'package:flutter/material.dart';
import '../../Adaptive/Picker/adaptive_picker.dart';
import 'package:get/get.dart';

final _nowDate = DateTime.now();
int _year = 365;

class DatePickerSheet extends StatelessWidget {
  final String title;

  final String? onConfirmLabel;
  final DateTime init;
  final Function(DateTime? date) onConfirmed;

  const DatePickerSheet({
    super.key,
    this.title = "",
    this.onConfirmLabel,
    required this.init,
    required this.onConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final minDate = _nowDate;
      return AdaptivePicker.cupertinoDatePicker(
        context,
        onConfirm: onConfirmed,
        title: title,
        onConfirmLabel: onConfirmLabel ?? "done".tr,
        initial: (init.isAfter(minDate)) ? init : minDate,
        minimumYear: _nowDate.year,
        minDate: _nowDate,
        maxDate: _nowDate.add(Duration(days: _year * 100)),
        maximumYear: _nowDate.add(Duration(days: _year * 100)).year,
      );
    });
  }
}
