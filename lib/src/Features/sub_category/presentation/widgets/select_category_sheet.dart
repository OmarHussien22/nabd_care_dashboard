import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/general_select_sheet.dart';

class SelectCategorySheet extends StatelessWidget {
  final int selectId;
  final TextEditingController controller;
  final Function(CategoryModel) onSelected;
  const SelectCategorySheet(
      {super.key,
      required this.selectId,
      required this.controller,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCategoryLocalController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GetBuilder<GetCategoryLocalController>(
            builder: (logic) {
              return GeneralSelectSheet<CategoryModel>(
                title: "select_category",
                headerText: "select_category",
                headerTextSize: 5,
                needValidate: true,
                hintText: "select_category",
                items: logic.categories ?? [],
                onSelected: onSelected,
                controller: controller,
                selectedId: selectId,
              );
            },
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 40),
        //   child: IconButton(
        //       onPressed: () {
        //         Get.put(GetRolesLocalController()).fetchUserRoles();
        //       },
        //       icon: Icon(Icons.get_app)),
        // ),
      ],
    );
  }
}
