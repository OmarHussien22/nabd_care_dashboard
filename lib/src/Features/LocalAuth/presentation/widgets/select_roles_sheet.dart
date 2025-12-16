import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/entities/roles_entity.dart';
import 'package:care_desk/src/Features/LocalAuth/presentation/manager/get_roles_local_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/general_select_sheet.dart';

class SelectRolesSheet extends StatelessWidget {
  const SelectRolesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final GetRolesLocalController controller =
        Get.put(GetRolesLocalController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GetBuilder<GetRolesLocalController>(
            builder: (logic) {
              return GeneralSelectSheet<RolesModel>(
                title: "chossen_role",
                headerText: "select_your_role",
                hintText: "chossen_role",
                fetch: logic.fetchUserRoles,
                items: logic.state.data ?? [],
                onSelected: (value) {
                  logic.selectRoleId(value);
                },
                controller: logic.roleController,
                selectedId: logic.roleId,
              );
            },
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 40),
        //   child: IconButton(
        //       onPressed: () {
        //         controller.fetchUserRoles();
        //       },
        //       icon: Icon(Icons.get_app)),
        // ),
      ],
    );
  }
}
