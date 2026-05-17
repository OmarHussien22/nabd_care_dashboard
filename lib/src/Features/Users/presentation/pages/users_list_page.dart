import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../manager/users_list_controller.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import '../../../../Shared/Presentation/Widgets/tables/table/custom_table.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersListController());

    return AppContentWrapper(
      title: 'Users Management',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Users'),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () => context.go('/users/create'),
          icon: const Icon(Icons.add, size: 20),
          label: const Text('Add New User'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: GetBuilder<UsersListController>(
        id: 'users_list',
        builder: (cnt) {
          if (cnt.state is DataLoading && cnt.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cnt.users.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.toH()),
                child: Column(
                  children: [
                    Icon(Icons.person_off_outlined, size: 64.toRad(), color: AppColors.get.textSecondary.withOpacity(0.5)),
                    16.ESH(),
                    CustomText('No users found', fontSize: 16, color: AppColors.get.textSecondary),
                  ],
                ),
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.toRad()),
              border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
            ),
            child: CustomTable(
              columnNames: const ['User', 'Email', 'Role', 'Status'],
              data: cnt.users.map((u) => [
                _buildUserCell(u.name, u.avatar),
                u.email,
                _buildRoleBadge(u.userTypeId.toString()), 
                _buildStatusBadge(u.isActive ==true? "Active":"Inactive"),
              ]).toList(),
              customRowActions: [
                (data) {
                  return ActionIconButton(
                    icon: Icons.visibility_outlined,
                    color: AppColors.get.textSecondary,
                    onTap: () {},
                    tooltipMessage: 'View Details',
                  );
                },
                (data) {
                  return ActionIconButton(
                    icon: Icons.edit_outlined,
                    color: AppColors.get.primary,
                    onTap: () => context.go('/users/edit/1'),
                    tooltipMessage: 'Edit User',
                  );
                },
                (data) => ActionIconButton(
                  icon: Icons.delete_outline,
                  color: AppColors.get.red,
                  onTap: () {},
                  tooltipMessage: 'Delete User',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserCell(String name, String? avatar) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14.toRad(),
          backgroundColor: AppColors.get.primary.withOpacity(0.1),
          child: CustomText(
            name[0].toUpperCase(),
            fontSize: 12,
            color: AppColors.get.primary,
            fontWeight: FW.bold,
          ),
        ),
        12.ESW(),
        CustomText(
          name,
          fontSize: 13,
          fontWeight: FW.semiBold,
          color: AppColors.get.textPrimary,
        ),
      ],
    );
  }

  Widget _buildRoleBadge(String role) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.toW(), vertical: 4.toH()),
      decoration: BoxDecoration(
        color: AppColors.get.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.toRad()),
      ),
      child: CustomText(
        role,
        fontSize: 12,
        color: AppColors.get.primary,
        fontWeight: FW.semiBold,
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8.toRad(),
          height: 8.toRad(),
          decoration: BoxDecoration(
            color: AppColors.get.success,
            shape: BoxShape.circle,
          ),
        ),
        8.ESW(),
        CustomText(
          status,
          fontSize: 12,
          color: AppColors.get.textPrimary,
        ),
      ],
    );
  }
}
