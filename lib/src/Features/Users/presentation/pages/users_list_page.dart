import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
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
      title: 'users_management'.toTr(),
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'dashboard'.toTr(), route: '/dashboard'),
          BreadcrumbItem(label: 'users'.toTr()),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () => context.go('/users/create'),
          icon: const Icon(Icons.add, size: 20),
          label: Text('add_new_user'.toTr()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toRad())),
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
                    Icon(Icons.person_off_outlined,
                        size: 64.toRad(),
                        color: AppColors.get.textSecondary.withOpacity(0.5)),
                    16.ESH(),
                    CustomText('no_users_found'.toTr(),
                        fontSize: 16, color: AppColors.get.textSecondary),
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
              columnNames: ['user'.toTr(), 'email'.toTr(), 'role'.toTr(), 'status'.toTr()],
              data: cnt.users
                  .map((u) => [
                        _buildUserCell(u.name, u.avatar),
                        u.email,
                        _buildRoleBadge(u.userTypeId.toString()),
                        _buildStatusBadge(
                            u.isActive == true ? 'active'.toTr() : 'inactive'.toTr()),
                      ])
                  .toList(),
              customRowActions: [
                (data) {
                  final email = data[1] as String;
                  final idx =
                      controller.users.indexWhere((u) => u.email == email);
                  if (idx == -1) return const SizedBox();
                  final user = controller.users[idx];

                  return ActionIconButton(
                    icon: Icons.visibility_outlined,
                    color: AppColors.get.textSecondary,
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          title: Row(
                            children: [
                              Icon(Icons.badge_rounded,
                                  color: AppColors.get.primary, size: 24),
                              const SizedBox(width: 12),
                              CustomText('user_details'.toTr(),
                                  fontSize: 16, fontWeight: FW.bold),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText('${'full_name'.toTr()}: ${user.name}',
                                  fontSize: 13, fontWeight: FW.bold),
                              const SizedBox(height: 8),
                              CustomText('${'email_address'.toTr()}: ${user.email}',
                                  fontSize: 12.5),
                              const SizedBox(height: 8),
                              CustomText('${'role_level_id'.toTr()}: ${user.userTypeId}',
                                  fontSize: 12.5),
                              const SizedBox(height: 8),
                              CustomText(
                                  '${'status'.toTr()}: ${user.isActive == true ? 'active'.toTr() : 'inactive'.toTr()}',
                                  fontSize: 12.5,
                                  color: user.isActive == true
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FW.bold),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Get.back(),
                                child: Text('close'.toTr())),
                          ],
                        ),
                      );
                    },
                    tooltipMessage: 'view_details'.toTr(),
                  );
                },
                (data) {
                  final email = data[1] as String;
                  final idx =
                      controller.users.indexWhere((u) => u.email == email);
                  if (idx == -1) return const SizedBox();
                  final user = controller.users[idx];

                  return ActionIconButton(
                    icon: Icons.edit_outlined,
                    color: AppColors.get.primary,
                    onTap: () => context.go('/users/edit/${user.id}'),
                    tooltipMessage: 'edit_user'.toTr(),
                  );
                },
                (data) {
                  final email = data[1] as String;
                  final idx =
                      controller.users.indexWhere((u) => u.email == email);
                  if (idx == -1) return const SizedBox();
                  final user = controller.users[idx];

                  return ActionIconButton(
                    icon: Icons.delete_outline,
                    color: AppColors.get.red,
                    onTap: () async {
                      final confirmed = await Get.dialog<bool>(
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          title: CustomText('delete_user'.toTr(),
                              fontSize: 16, fontWeight: FW.bold),
                          content: CustomText(
                              'delete_user_confirm'.toTr().replaceAll('@name', user.name),
                              fontSize: 13),
                          actions: [
                            TextButton(
                                onPressed: () => Get.back(result: false),
                                child: Text('cancel'.toTr())),
                            ElevatedButton(
                              onPressed: () => Get.back(result: true),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                              child: Text('delete'.toTr()),
                            ),
                          ],
                        ),
                      );
                      if (confirmed == true) {
                        controller.users.removeAt(idx);
                        controller.update();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: CustomText(
                                'user_deleted_success'.toTr(),
                                color: Colors.white,
                                fontSize: 13,
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                    tooltipMessage: 'delete_user'.toTr(),
                  );
                },
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
