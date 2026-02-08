import 'package:flutter/material.dart';

class TableRowData {
  final String id;
  final List<Widget> cells;
  final VoidCallback? onTap;

  TableRowData({
    required this.id,
    required this.cells,
    this.onTap,
  });
}
