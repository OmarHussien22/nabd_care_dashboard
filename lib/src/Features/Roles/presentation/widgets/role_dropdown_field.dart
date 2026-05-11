import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import '../../../Users/domain/entities/auth_entities.dart';

class RoleDropdownField extends StatelessWidget {
  final RoleEntity? selectedRole;
  final List<RoleEntity> roles;
  final Function(RoleEntity?) onChanged;

  const RoleDropdownField({
    super.key,
    required this.selectedRole,
    required this.roles,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'System Role',
          fontSize: 14,
          fontWeight: FW.semiBold,
          color: AppColors.get.textPrimary,
        ),
        8.ESH(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.toW()),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.toRad()),
            border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<RoleEntity>(
              value: selectedRole,
              isExpanded: true,
              hint: const Text('Select user role'),
              items: roles.map((role) {
                return DropdownMenuItem<RoleEntity>(
                  value: role,
                  child: Text(role.name),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
