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
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';

class RolesListPage extends StatelessWidget {
  const RolesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RolesListController());

    return AppContentWrapper(
      title: 'roles_permissions'.toTr(),
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'dashboard'.toTr(), route: '/dashboard'),
          BreadcrumbItem(label: 'roles'.toTr()),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () => context.go('/roles/create'),
          icon: const Icon(Icons.security, size: 20),
          label: Text('define_new_role'.toTr()),
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
              columnNames: ['role_name'.toTr(), 'permissions_count'.toTr(), 'actions'.toTr()],
              data: cnt.roles.map((role) => [
                role.name,
                role.permissions.length.toString(),
                '', // Placeholder for Actions column if needed, but we use customRowActions
              ]).toList(),
              customRowActions: [
                (data) {
                  final roleName = data[0] as String;
                  final idx = cnt.roles.indexWhere((r) => r.name == roleName);
                  if (idx == -1) return const SizedBox();
                  final role = cnt.roles[idx];

                  return ActionIconButton(
                    icon: Icons.edit_outlined,
                    color: AppColors.get.primary,
                    onTap: () => context.go('/roles/edit/${role.id}'),
                    tooltipMessage: 'edit_role'.toTr(),
                  );
                },
                (data) {
                  final roleName = data[0] as String;
                  final idx = cnt.roles.indexWhere((r) => r.name == roleName);
                  if (idx == -1) return const SizedBox();
                  final role = cnt.roles[idx];

                  return ActionIconButton(
                    icon: Icons.delete_outline,
                    color: AppColors.get.red,
                    onTap: () async {
                      final confirmed = await Get.dialog<bool>(
                        AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          title: CustomText('delete_role'.toTr(), fontSize: 16, fontWeight: FW.bold),
                          content: CustomText('delete_role_confirmation'.toTr().replaceAll('@role', role.name), fontSize: 13),
                          actions: [
                            TextButton(onPressed: () => Get.back(result: false), child: Text('cancel'.toTr())),
                            ElevatedButton(
                              onPressed: () => Get.back(result: true),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                              child: Text('delete'.toTr()),
                            ),
                          ],
                        ),
                      );
                      if (confirmed == true) {
                        cnt.roles.removeAt(idx);
                        cnt.update();
                        Get.snackbar('success'.toTr(), 'role_removed_success'.toTr(), backgroundColor: Colors.green, colorText: Colors.white);
                      }
                    },
                    tooltipMessage: 'delete_role'.toTr(),
                  );
                },
              ],
            ),
          );
        },
      ),
    );
  }
}
