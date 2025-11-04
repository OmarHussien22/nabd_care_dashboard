import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

class AddCategoryLocalService extends DataBaseServiceInterface {
  static final AddCategoryLocalService instance = AddCategoryLocalService._();
  AddCategoryLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.insert,
      table: TablesNames.categoriesTable,
      params: params,
      showLoading: true,
    );
  }
}
