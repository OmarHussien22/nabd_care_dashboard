class TableColumn {
  final String label;
  final double width;
  final bool isSortable;

  const TableColumn({
    required this.label,
    this.width = 150,
    this.isSortable = false,
  });
}
