import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/product/core/add_product_params.dart';
import 'package:getx_base_code/src/Features/product/domain/repositories/add_product_local_repo.dart';

class AddProductLocalUseCase extends LocalUseCase<bool, AddProductParams> {
  @override
  Future<DataState<bool>> call({AddProductParams? params}) async {
    return await AddProductLocalRepo.instance.call(params: params)!;
  }
}
