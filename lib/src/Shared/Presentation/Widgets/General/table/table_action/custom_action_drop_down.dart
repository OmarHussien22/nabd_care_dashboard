import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/action_menu_item.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/enum_action_table.dart';
import 'package:flutter/material.dart';

class CustomActionDropDown extends StatelessWidget {
  final Function(String)? onView;
  final Function(String)? onEdit;
  final Function(String)? onDelete;
  final String rowId;
  const CustomActionDropDown(
      {super.key,
      this.onView,
      this.onEdit,
      this.onDelete,
      required this.rowId});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 8),
      child: PopupMenuButton<TableActionType>(
        tooltip: 'Actions',
        icon: Icon(
          Icons.more_vert,
          size: 18.toRad(),
          color: AppColors.get.textSecondary,
        ),
        onSelected: (action) {
          switch (action) {
            case TableActionType.view:
              onView?.call(rowId);
              break;
            case TableActionType.edit:
              onEdit?.call(rowId);
              break;
            case TableActionType.delete:
              onDelete?.call(rowId);
              break;
          }
        },
        itemBuilder: (context) => [
          if (onView != null)
            PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              value: TableActionType.view,
              child: ActionMenuItem(
                icon: Icons.visibility_outlined,
                tooltip: 'View',
                onTap: onView?.call(rowId),
                label: 'View',
              ),
            ),
          if (onEdit != null)
            PopupMenuItem(
              value: TableActionType.edit,
              child: ActionMenuItem(
                icon: Icons.edit_outlined,
                label: 'Edit',
                onTap: onEdit?.call(rowId),
                tooltip: "Edit",
              ),
            ),
          if (onDelete != null)
            PopupMenuItem(
              value: TableActionType.delete,
              child: ActionMenuItem(
                icon: Icons.delete_outline,
                // color هنظبطها تحت
                label: 'Delete',
                onTap: onDelete?.call(rowId),
                tooltip: "Delete",
              ),
            ),
        ],
      ),
    );
  }
}
