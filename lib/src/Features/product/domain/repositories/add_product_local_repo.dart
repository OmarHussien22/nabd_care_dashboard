import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/product/data/data_sources/add_product_local_service.dart';

class AddProductLocalRepo extends LocalRepoInterface<bool> {
  AddProductLocalRepo._();
  static final instance = AddProductLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      AddProductLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withoutData;

  @override
  bool Function(dynamic data) get onParse => (data) => true;
}
