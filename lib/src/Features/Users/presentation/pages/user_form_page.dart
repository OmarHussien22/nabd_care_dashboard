import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import '../manager/user_controller.dart';
import '../../../Roles/presentation/widgets/role_dropdown_field.dart'; // I will create this

class UserFormPage extends StatelessWidget {
  final bool isEdit;
  const UserFormPage({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return AppContentWrapper(
      title: isEdit ? 'edit_user'.toTr() : 'create_new_user'.toTr(),
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'dashboard'.toTr(), route: '/dashboard'),
          BreadcrumbItem(label: 'users'.toTr(), route: '/users'),
          BreadcrumbItem(label: isEdit ? 'edit'.toTr() : 'create'.toTr()),
        ],
      ),
      child: GetBuilder<UserController>(
        id: 'user_form',
        builder: (cnt) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildFormSection(
                      title: 'basic_information'.toTr(),
                      subtitle: 'personal_details_subtitle'.toTr(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldDefault(
                                  controller: cnt.nameController,
                                  header: TFFHeader(title: 'full_name'.toTr()),
                                  hint: const TFFHint(title: 'e.g. John Doe'),
                                  isRequired: true,
                                  prefix: PrefixWithIconData(iconData: Icons.person_outline),
                                ),
                              ),
                              24.ESW(),
                              Expanded(
                                child: TextFieldDefault(
                                  controller: cnt.emailController,
                                  header: TFFHeader(title: 'email_address'.toTr()),
                                  hint: const TFFHint(title: 'e.g. john@example.com'),
                                  isRequired: true,
                                  prefix: PrefixWithIconData(iconData: Icons.email_outlined),
                                ),
                              ),
                            ],
                          ),
                          24.ESH(),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldDefault(
                                  controller: cnt.phoneController,
                                  header: TFFHeader(title: 'phone_number'.toTr()),
                                  hint: const TFFHint(title: '+1 234 567 890'),
                                  prefix: PrefixWithIconData(iconData: Icons.phone_outlined),
                                ),
                              ),
                              24.ESW(),
                              const Expanded(child: SizedBox()), 
                            ],
                          ),
                        ],
                      ),
                    ),
                    24.ESH(),
                    _buildFormSection(
                      title: 'account_settings'.toTr(),
                      subtitle: 'assign_roles_subtitle'.toTr(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: cnt.isLoadingRoles 
                                  ? const LinearProgressIndicator()
                                  : RoleDropdownField(
                                      selectedRole: cnt.selectedRole,
                                      roles: cnt.roles,
                                      onChanged: (role) => cnt.setSelectedRole(role),
                                    ),
                              ),
                              24.ESW(),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    32.ESH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24.toW(), vertical: 16.toH()),
                          ),
                          child: CustomText('discard_changes'.toTr(), color: AppColors.get.textSecondary),
                        ),
                        16.ESW(),
                        ElevatedButton(
                          onPressed: () => cnt.saveUser(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.get.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 40.toW(), vertical: 18.toH()),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toRad())),
                            elevation: 0,
                          ),
                          child: Text(isEdit ? 'save_changes'.toTr() : 'create_account'.toTr()),
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

  Widget _buildFormSection({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
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
          CustomText(title, fontSize: 18, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          4.ESH(),
          CustomText(subtitle, fontSize: 13, color: AppColors.get.textSecondary),
          20.ESH(),
          Divider(color: AppColors.get.border.withOpacity(0.3)),
          24.ESH(),
          child,
        ],
      ),
    );
  }
}
