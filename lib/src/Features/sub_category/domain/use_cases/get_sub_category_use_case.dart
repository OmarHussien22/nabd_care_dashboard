import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/sub_category/data/models/sub_category_model.dart';
import 'package:getx_base_code/src/Features/sub_category/domain/repositories/get_sub_category_local_repo.dart';

class GetSubCategoryUseCase extends LocalUseCase<List<SubCategoryModel>, void> {
  @override
  Future<DataState<List<SubCategoryModel>>> call({void params}) async {
    return await GetSubCategoryLocalRepo.instance.call()!;
  }
}
