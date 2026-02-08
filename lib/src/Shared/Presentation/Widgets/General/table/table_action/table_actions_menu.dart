import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/enum_action_table.dart';
import 'package:flutter/material.dart';
import 'table_action_item.dart';

class TableActionsMenu extends StatelessWidget {
  final List<TableActionItem> actions;
  final bool showOnHover;

  const TableActionsMenu({
    super.key,
    required this.actions,
    this.showOnHover = false,
  });

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();

    return PopupMenuButton<TableActionType>(
      tooltip: 'Actions',
      icon: const Icon(Icons.more_vert, size: 18),
      onSelected: (type) {
        final action = actions.firstWhere((a) => a.type == type);
        action.onTap();
      },
      itemBuilder: (context) => actions
          .map(
            (action) => PopupMenuItem<TableActionType>(
              value: action.type,
              child: _MenuItem(action: action),
            ),
          )
          .toList(),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final TableActionItem action;

  const _MenuItem({required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(action.icon, size: 18, color: action.color),
        const SizedBox(width: 8),
        Text(
          action.label,
          style: TextStyle(color: action.color),
        ),
      ],
    );
  }
}
