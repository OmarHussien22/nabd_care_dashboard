import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/category/core/add_category_params.dart';
import 'package:getx_base_code/src/Features/category/domain/repositories/add_category_local_repo.dart';

class AddCategoryLocalUseCase extends LocalUseCase<bool, AddCategoryParams> {
  @override
  Future<DataState<bool>> call({AddCategoryParams? params}) async {
    return await AddCategoryLocalRepo.instance.call(params: params)!;
  }
}
