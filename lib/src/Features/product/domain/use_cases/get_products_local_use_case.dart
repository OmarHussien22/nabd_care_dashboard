import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/product/domain/entities/product_entity.dart';
import 'package:getx_base_code/src/Features/product/domain/repositories/get_product_local_repo.dart';

class GetProductsLocalUseCase extends LocalUseCase<List<ProductEntity>, void> {
  @override
  Future<DataState<List<ProductEntity>>>? call({void params}) {
    return GetProductLocalRepo.instance.call();
  }
}
