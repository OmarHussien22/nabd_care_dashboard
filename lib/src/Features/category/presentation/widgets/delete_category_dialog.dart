import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/category/presentation/manager/get_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';

import '../../../../../Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import '../../../../Core/LocalDataBaseStructure/localDataSource/methods/delete_data_base_method.dart';

class DeleteCategoryDialog {
  static void deleteCategory(CategoryModel category) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text("تأكيد الحذف"),
        content: const Text("هل أنت متأكد أنك تريد حذف هذه الفئة؟"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () async {
              await DeleteDataBaseMethod.instance.delete(
                table: TablesNames.categoriesTable,
                where: "id = ?",
                whereArgs: [category.id],
              );
              Get.find<GetCategoryLocalController>().fetchLocalCategories();
              Get.back();
              ClientSnacks.successMessage(message: "تمت الحذف بنجاح");
            },
            child: const Text("نعم"),
          ),
        ],
      ),
    );
  }
}
