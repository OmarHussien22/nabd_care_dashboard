import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/category/domain/use_cases/get_category_use_case.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class GetCategoryLocalController
    extends GetControllerInterface<List<CategoryModel>> {
  List<CategoryModel> categories = [];

  Future<void> fetchLocalCategories() async {
    emit(const DataLoading());
    final GetCategoryUseCase useCase = GetCategoryUseCase();
    state = await useCase.call();
    if (state is DataSuccess) {
      printDM("Success");
      categories = state.data!;
      getDataTable();
      printDM("categories: $categories");
    } else if (state is DataFailed) {
      printDM("Error");
    }
    emit(state);
  }

  List<List<dynamic>> tableData = [];
  getDataTable() {
    update();
    tableData = categories.map((category) {
      return [category.id, category.nameAr, category.nameEn];
    }).toList();
    printDM("tableData: $tableData");
    return tableData;
  }

  @override
  void onInit() {
    fetchLocalCategories();
    super.onInit();
  }
}
