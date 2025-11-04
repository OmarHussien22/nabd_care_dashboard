import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';

class AddRolesLocalService extends DataBaseServiceInterface {
  static final AddRolesLocalService instance = AddRolesLocalService._();
  AddRolesLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.insert,
      table: TablesNames.rolesUsersTable,
      params: params,
      showLoading: true,
    );
  }
}
