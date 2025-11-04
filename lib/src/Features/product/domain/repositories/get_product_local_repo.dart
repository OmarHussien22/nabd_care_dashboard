import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/product/data/data_sources/get_product_local_service.dart';
import 'package:getx_base_code/src/Features/product/data/models/product_model.dart';
import 'package:getx_base_code/src/Features/product/domain/entities/product_entity.dart';

class GetProductLocalRepo extends LocalRepoInterface<List<ProductEntity>> {
  GetProductLocalRepo._();
  static final instance = GetProductLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      GetProductLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withData;

  @override
  List<ProductEntity> Function(dynamic data) get onParse => (data) {
        return (data as List).map((e) => ProductModel.fromJson(e)).toList();
      };
}
