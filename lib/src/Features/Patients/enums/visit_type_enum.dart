import 'package:flutter/material.dart';

enum VisitTypeEnum {
  newVisit(1, 'new_visit', Colors.green),
  followUp(2, 'follow_up', Colors.blue);

  final int value;
  final String label;
  final Color color;

  const VisitTypeEnum(this.value, this.label, this.color);

  static VisitTypeEnum fromValue(int value) {
    return VisitTypeEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => VisitTypeEnum.newVisit,
    );
  }
}
