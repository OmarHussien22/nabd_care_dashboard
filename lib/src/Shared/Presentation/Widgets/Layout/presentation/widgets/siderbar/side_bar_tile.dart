import 'package:flutter/material.dart';

import '../../../../../../../Core/Services/Navigation/navigation_service.dart';
import '../../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../GeneralWidgets/Text/custom_text_lib.dart';
import '../../../domain/entity/side_bar_item_entity.dart';

class SidebarTile extends StatelessWidget {
  final SideBarItemEntity item;
  final bool selected;

  const SidebarTile({
    super.key,
    required this.item,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.toRad()),
      onTap: () => NavigationService.instance.go(item.route),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.get.primary.withOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 22.toRad(),
              color: selected
                  ? AppColors.get.primary
                  : AppColors.get.textSecondary,
            ),
            16.ESW(),
            Expanded(
              child: CustomText(
                item.label,
                fontSize: selected ? 13 : 12,
                fontWeight: selected ? FW.bold : FW.medium,
                color: selected
                    ? AppColors.get.primary
                    : AppColors.get.textSecondary,
              ),
            ),
            if (selected)
              Container(
                width: 6.toRad(),
                height: 6.toRad(),
                decoration: BoxDecoration(
                  color: AppColors.get.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.get.primary.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
