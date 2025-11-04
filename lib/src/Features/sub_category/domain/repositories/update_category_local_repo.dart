import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/category/data/data_sources/update_category_local_service.dart';

class UpdateCategoryLocalRepo extends LocalRepoInterface<bool> {
  UpdateCategoryLocalRepo._();
  static final instance = UpdateCategoryLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      UpdateCategoryLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withoutData;

  @override
  bool Function(dynamic data) get onParse => (data) => true;
}
