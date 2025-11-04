import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

class UpdateCategoryLocalService extends DataBaseServiceInterface {
  static final UpdateCategoryLocalService instance =
      UpdateCategoryLocalService._();
  UpdateCategoryLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.update,
      table: TablesNames.categoriesTable,
      params: params,
      where: "id = ?",
      whereArgs: [params!.toJson()],
      showLoading: true,
    );
  }
}
