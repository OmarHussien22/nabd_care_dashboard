import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';

import '../../core/add_sub_category_params.dart';
import '../repositories/add_sub_category_local_repo.dart';

class AddSubCategoryLocalUseCase
    extends LocalUseCase<bool, AddSubCategoryParams> {
  @override
  Future<DataState<bool>> call({AddSubCategoryParams? params}) async {
    return await AddSubCategoryLocalRepo.instance.call(params: params)!;
  }
}
