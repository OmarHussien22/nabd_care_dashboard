import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:go_router/go_router.dart';

class BreadcrumbItem {
  final String label;
  final String? route;

  const BreadcrumbItem({required this.label, this.route});
}

class AppBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;

  const AppBreadcrumb({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (!isLast && item.route != null) 
                  ? () => context.go(item.route!) 
                  : null,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.toH(), horizontal: 4.toW()),
                child: CustomText(
                  item.label,
                  fontSize: 13,
                  color: isLast ? AppColors.get.primary : AppColors.get.textSecondary,
                  fontWeight: isLast ? FW.semiBold : FW.medium,
                ),
              ),
            ),
            if (!isLast)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.toW()),
                child: Icon(
                  Icons.chevron_right,
                  size: 16.toRad(),
                  color: AppColors.get.textDisabled,
                ),
              ),
          ],
        );
      }).toList(),
    );
  }
}
