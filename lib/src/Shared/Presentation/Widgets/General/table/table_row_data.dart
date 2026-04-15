import 'package:flutter/material.dart';

class TableRowData {
  final int id;
  final String showId;
  final List<Widget> cells;
  final VoidCallback? onTap;

  TableRowData({
    required this.id,
    required this.cells,
    required this.showId,
    this.onTap,
  });
}
