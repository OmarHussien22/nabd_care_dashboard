import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';

import '../../data/data_sources/add_sub_category_local_service.dart';

class AddSubCategoryLocalRepo extends LocalRepoInterface<bool> {
  AddSubCategoryLocalRepo._();
  static final instance = AddSubCategoryLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      AddSubCategoryLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withoutData;

  @override
  bool Function(dynamic data) get onParse => (data) => true;
}
