import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:get/get.dart';
import '../manager/role_controller.dart';
import '../../../Users/domain/entities/auth_entities.dart';

class RoleFormPage extends StatelessWidget {
  final bool isEdit;
  const RoleFormPage({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoleController());

    return AppContentWrapper(
      title: isEdit ? 'Edit Role' : 'Define Role',
      breadcrumb: AppBreadcrumb(
        items: [
          const BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          const BreadcrumbItem(label: 'Roles', route: '/roles'),
          BreadcrumbItem(label: isEdit ? 'Edit' : 'Create'),
        ],
      ),
      child: GetBuilder<RoleController>(
        id: 'role_form',
        builder: (cnt) {
          if (cnt.isLoadingPermissions) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildFormSection(
                      title: 'Role Identity',
                      subtitle: 'Give this role a name and description',
                      child: TextFieldDefault(
                        controller: cnt.nameController,
                        header: const TFFHeader(title: 'Role Name'),
                        hint: const TFFHint(title: 'e.g. Senior Doctor'),
                        isRequired: true,
                        prefix:
                            PrefixWithIconData(iconData: Icons.badge_outlined),
                      ),
                    ),
                    24.ESH(),
                    _buildFormSection(
                      title: 'Permissions Matrix',
                      subtitle: 'Select which actions this role can perform',
                      child: Column(
                        children: cnt.groupedPermissions.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: _buildPermissionCategory(
                              cnt,
                              entry.key,
                              entry.value,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    32.ESH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child: CustomText('Cancel',
                              color: AppColors.get.textSecondary),
                        ),
                        24.ESW(),
                        ElevatedButton(
                          onPressed: () => cnt.saveRole(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.get.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.toW(), vertical: 18.toH()),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.toRad())),
                            elevation: 0,
                          ),
                          child: Text(isEdit ? 'Save Role' : 'Create Role'),
                        ),
                      ],
                    ),
                    40.ESH(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormSection(
      {required String title,
      required String subtitle,
      required Widget child}) {
    return Container(
      padding: EdgeInsets.all(32.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title,
              fontSize: 18,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary),
          4.ESH(),
          CustomText(subtitle,
              fontSize: 13, color: AppColors.get.textSecondary),
          20.ESH(),
          Divider(color: AppColors.get.border.withOpacity(0.3)),
          24.ESH(),
          child,
        ],
      ),
    );
  }

  Widget _buildPermissionCategory(
      RoleController cnt, String category, List<PermissionEntity> permissions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.folder_open, size: 20, color: AppColors.get.primary),
            12.ESW(),
            CustomText(category, fontWeight: FW.semiBold, fontSize: 15),
          ],
        ),
        16.ESH(),
        Wrap(
          spacing: 16.toW(),
          runSpacing: 16.toH(),
          children:
              permissions.map((p) => _buildPermissionCard(cnt, p)).toList(),
        ),
      ],
    );
  }

  Widget _buildPermissionCard(RoleController cnt, PermissionEntity permission) {
    final isSelected = cnt.isPermissionSelected(permission.id);

    return InkWell(
      onTap: () => cnt.togglePermission(permission.id),
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        width: 220.toW(),
        padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.get.primary.withOpacity(0.05)
              : AppColors.get.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.toRad()),
          border: Border.all(
              color: isSelected
                  ? AppColors.get.primary.withOpacity(0.3)
                  : AppColors.get.border.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                permission.name,
                fontSize: 13,
                color: isSelected
                    ? AppColors.get.primary
                    : AppColors.get.textPrimary,
                fontWeight: isSelected ? FW.semiBold : FW.regular,
              ),
            ),
            SizedBox(
              height: 24,
              child: Switch.adaptive(
                value: isSelected,
                activeColor: AppColors.get.primary,
                onChanged: (v) => cnt.togglePermission(permission.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
