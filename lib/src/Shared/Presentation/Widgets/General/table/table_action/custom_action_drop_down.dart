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
  const CustomActionDropDown({
    super.key,
    this.onView,
    this.onEdit,
    this.onDelete,
    required this.rowId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 8),
      child: PopupMenuButton<TableActionType>(
        tooltip: 'Actions',
        offset: const Offset(0, 40),
        elevation: 4,
        shadowColor: AppColors.get.shadow.withOpacity(0.3),
        surfaceTintColor: AppColors.get.main,
        color: AppColors.get.main,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
              color: AppColors.get.border.withOpacity(0.5), width: 1),
        ),
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.get.surfaceContainer.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.more_horiz_rounded,
            size: 20.toRad(),
            color: AppColors.get.textSecondary,
          ),
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
              value: TableActionType.view,
              padding: EdgeInsets.zero,
              child: ActionMenuItem(
                icon: Icons.visibility_outlined,
                label: 'View Details',
                onTap: () => onView?.call(rowId),
                tooltip: 'View',
              ),
            ),
          if (onEdit != null)
            PopupMenuItem(
              value: TableActionType.edit,
              padding: EdgeInsets.zero,
              child: ActionMenuItem(
                icon: Icons.edit_outlined,
                label: 'Edit Info',
                onTap: () => onEdit?.call(rowId),
                tooltip: "Edit",
              ),
            ),
          if (onDelete != null)
            PopupMenuItem(
              value: TableActionType.delete,
              padding: EdgeInsets.zero,
              child: ActionMenuItem(
                icon: Icons.delete_outline_rounded,
                color: AppColors.get.error,
                label: 'Delete Record',
                onTap: () => onDelete?.call(rowId),
                tooltip: "Delete",
              ),
            ),
        ],
      ),
    );
  }
}
