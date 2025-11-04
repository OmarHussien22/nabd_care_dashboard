import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/category/data/data_sources/get_category_local_service.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';

class GetCategoryLocalRepo extends LocalRepoInterface<List<CategoryModel>> {
  GetCategoryLocalRepo._();
  static final instance = GetCategoryLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      GetCategoryLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withData;

  @override
  List<CategoryModel> Function(dynamic data) get onParse => (data) {
        List<CategoryModel> categories = [];
        data.forEach((element) {
          categories.add(CategoryModel.fromJson(element));
        });
        return categories;
      };
}
