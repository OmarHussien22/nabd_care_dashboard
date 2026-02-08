import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/enum_action_table.dart';
import 'package:flutter/material.dart';

class TableActionItem {
  final TableActionType type;
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const TableActionItem({
    required this.type,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });
}
