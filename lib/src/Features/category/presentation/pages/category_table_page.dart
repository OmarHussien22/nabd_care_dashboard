import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Constants/Strings/Assets/app_images.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Features/category/presentation/widgets/add_category_dialog.dart';
import 'package:getx_base_code/src/Features/category/presentation/widgets/delete_category_dialog.dart';
import 'package:getx_base_code/src/Features/category/presentation/widgets/update_category_dialog.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/DataBuilder/imports_data_builder.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/src/imports_text.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/Illustrations/Builder/imports_illustration_builder.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/tables/table/custom_table.dart';

class CategoryTablePage extends StatelessWidget {
  const CategoryTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCategoryLocalController());
//// Remove Scaffold appBar After Mmake Button add in app Bar
    return Scaffold(
     // appBar: AppBars.basic(title:  "categories"),
     
      body: GetBuilder<GetCategoryLocalController>(
        builder: (logic) {
          return DataStatusBuilder(
            status: logic.state,
            onErrorBuild: IllustrationPageBuilder(
              title: "لا يوجد بيانات",
              fontSizeTitle: 7,
              imageUrl: AppImages.empty,
            ),
            onDoneBuild: logic.categories.isNotEmpty
                ? CustomTable(
                    columnNames: ["id", "category_name_ar", "category_name_en"],
                    data: logic.tableData,
                    customRowActions: [
                      (data) => IconButton(
                            tooltip: "تعديل",
                            
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              final category = logic.categories
                                  .firstWhereOrNull(
                                      (element) => element.id == data[0]);
                              if (category != null) {
                                UpdateCategoryDialog.update(context,
                                    category: category);
                              } else {
                                printDM("⚠️ Category not found!");
                              }
                            },
                          ),
                      (data) => IconButton(
                            tooltip: "حذف",
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              final category = logic.categories
                                  .firstWhereOrNull(
                                      (element) => element.id == data[0]);
                              if (category != null) {
                                DeleteCategoryDialog.deleteCategory(category);
                              } else {
                                printDM("⚠️ Category not found!");
                              }
                            },
                          ),
                    ],
                  )
                : Container(
                    color: Colors.red,
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AddCategoryDialog().showAddCategoryDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


//  CustomTable(
//   columnNames: ['SKU', 'Product Name', 'Category', 'Brand', 'Price', 'Qty'],
//   data: [
//     ['PT001', 'Lenovo IdeaPad 3', 'Computers', 'Lenovo', '\$600', '100'],
//     ['PT002', 'Beats Pro', 'Electronics', 'Beats', '\$160', '140'],
//   ],
//   customRowActions: [
//     (data) => ActionIconButton(
//       icon: Icons.visibility_outlined,
//       color: Colors.blue,
//       onTap: () {},
//     ),
//     (data) => ActionIconButton(
//       icon: Icons.edit_outlined,
//       color: Colors.orange,
//       onTap: () {},
//     ),
//     (data) => ActionIconButton(
//       icon: Icons.delete_outline,
//       color: Colors.red,
//       onTap: () {},
//     ),
//   ],
// )