import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../manager/roles_list_controller.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import '../../../../Shared/Presentation/Widgets/tables/table/custom_table.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import '../../../../Core/network_structure/resources/data_state/data_state.dart';

class RolesListPage extends StatelessWidget {
  const RolesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RolesListController());

    return AppContentWrapper(
      title: 'Roles & Permissions',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Roles'),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () => context.go('/roles/create'),
          icon: const Icon(Icons.security, size: 20),
          label: const Text('Define New Role'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 14.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: GetBuilder<RolesListController>(
        id: 'roles_list',
        builder: (cnt) {
          if (cnt.state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.toRad()),
              border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
            ),
            child: CustomTable(
              columnNames: const ['Role Name', 'Permissions Count', 'Actions'],
              data: cnt.roles.map((role) => [
                role.name,
                role.permissions.length.toString(),
                '', // Placeholder for Actions column if needed, but we use customRowActions
              ]).toList(),
              customRowActions: [
                (data) => ActionIconButton(
                  icon: Icons.edit_outlined,
                  color: AppColors.get.primary,
                  onTap: () => context.go('/roles/edit/1'), // Should use real ID
                  tooltipMessage: 'Edit Role',
                ),
                (data) => ActionIconButton(
                  icon: Icons.delete_outline,
                  color: AppColors.get.red,
                  onTap: () {},
                  tooltipMessage: 'Delete Role',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
