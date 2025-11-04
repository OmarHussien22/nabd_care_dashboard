import 'package:flutter/material.dart';
import '../../Adaptive/Picker/adaptive_picker.dart';

class SheetTimePicker extends StatelessWidget {
  final String? title;
  final DateTime initial;
  final Function(DateTime? date) onConfirm;

  const SheetTimePicker({
    super.key,
    this.title,
    required this.onConfirm,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptivePicker.cupertinoTimePicker(
      context,
      title ?? "",
      onConfirm: onConfirm,
      initial: initial,
    );
  }
}
