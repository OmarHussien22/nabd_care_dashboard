import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/category/data/models/category_model.dart';
import 'package:getx_base_code/src/Features/category/domain/repositories/get_category_local_repo.dart';

class GetCategoryUseCase extends LocalUseCase<List<CategoryModel>, void> {
  @override
  Future<DataState<List<CategoryModel>>> call({void params}) async {
    return await GetCategoryLocalRepo.instance.call()!;
  }
}
