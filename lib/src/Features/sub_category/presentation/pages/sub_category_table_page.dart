import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/manager/get_sub_category_local_controller.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/widgets/add_sub_category_dialog.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/tables/table/custom_table.dart';

import '../widgets/delete_sub_category_dialog.dart';

class SubCategoryTablePage extends StatelessWidget {
  const SubCategoryTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetSubCategoryLocalController());

    return Scaffold(
      appBar: AppBar(title: const CustomText('sub_categories')),
      body: GetBuilder<GetSubCategoryLocalController>(
        builder: (logic) {
          return  CustomTable(
                    columnNames: [
                      "id",
                      "sub_category_name_ar",
                      "sub_category_name_en",
                      "category_name_ar",
                      "category_name_en",
                    ],
                    data: logic.tableData,
                    customRowActions: [
                      (data) => IconButton(
                            tooltip: "تعديل",
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // final subcategory = logic.subCategories
                              //     .firstWhereOrNull(
                              //         (element) => element.id == data[0]);
                              // if (category != null) {
                              //   UpdateCategoryDialog.update(context,
                              //       category: category);
                              // } else {
                              //   printDM("⚠️ Category not found!");
                              // }
                            },
                          ),
                      (data) => IconButton(
                            tooltip: "حذف",
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              final subCategory = logic.subCategories
                                  .firstWhereOrNull(
                                      (element) => element.id == data[0]);
                              if (subCategory != null) {
                                DeleteSubCategoryDialog.deleteSubCategory(
                                    subCategory);
                              } else {
                                printDM("⚠️ SubCategory not found!");
                              }
                            },
                          ),
                    ],
                  )
                ;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           //await DatabaseHelper.instance.inquiryDataBase();
          AddSubCategoryDialog().showAddCategoryDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
