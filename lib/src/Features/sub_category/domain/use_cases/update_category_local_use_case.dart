import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/category/core/update_category_params.dart';
import 'package:getx_base_code/src/Features/category/domain/repositories/update_category_local_repo.dart';

class UpdateCategoryLocalUseCase
    extends LocalUseCase<bool, UpdateCategoryParams> {
  @override
  Future<DataState<bool>> call({UpdateCategoryParams? params}) async {
    return await UpdateCategoryLocalRepo.instance.call(params: params)!;
  }
}
