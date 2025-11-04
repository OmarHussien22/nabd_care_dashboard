import 'package:getx_base_code/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/sub_category/data/models/sub_category_model.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class GetSubCategoryLocalController
    extends GetControllerInterface<List<SubCategoryModel>> {
  List<SubCategoryModel> subCategories = [];

  Future<DataState<List<SubCategoryModel>>> callQuery() async {
  try {
    final db = await DatabaseHelper.instance.database;

    final result = await db.rawQuery('''
  SELECT 
    subcategories.id,
    subcategories.category_id,              
    subcategories.name_ar AS sub_category_name_ar,
    subcategories.name_en AS sub_category_name_en,
    categories.name_ar AS category_name_ar,
    categories.name_en AS category_name_en
  FROM subcategories
  INNER JOIN categories ON subcategories.category_id = categories.id
''');


    subCategories = result.map((e) => SubCategoryModel.fromJson(e)).toList();
    getDataTable();
    update(); // ✅ بعد تجهيز الداتا فقط
    printDM("Fetched SubCategories: $subCategories"); 
    return DataSuccess(subCategories);
  } catch (e) {
    return DataFailed(ErrorModel(
      title: "Database Error: $e",
      type: ErrorType.dataEmpty,
    ));
  }
}


  List<List<dynamic>> tableData = [];
  getDataTable() {
    update();
    tableData = subCategories.map((subCategory) {
      return [
        subCategory.id,
        // subCategory.categoryId,
        subCategory.nameAr,
        subCategory.nameEn,
        subCategory.categoryNameAr,
        subCategory.categoryNameEn,
      ];
    }).toList();
    printDM("tableData: $tableData");
    return tableData;
  }

  @override
  void onInit() {
    callQuery();
    //fetchLocalSubCategories();
    super.onInit();
  }
}
