import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/sub_category/data/models/sub_category_model.dart';
import 'package:getx_base_code/src/Features/sub_category/presentation/manager/get_sub_category_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';

import '../../../../../Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import '../../../../Core/LocalDataBaseStructure/localDataSource/methods/delete_data_base_method.dart';

class DeleteSubCategoryDialog {
  static void deleteSubCategory(SubCategoryModel subCategory) {
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
                table: TablesNames.subcategoriesTable,
                where: "id = ?",
                whereArgs: [subCategory.id],
              );
              Get.find<GetSubCategoryLocalController>()
                  .callQuery();
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
