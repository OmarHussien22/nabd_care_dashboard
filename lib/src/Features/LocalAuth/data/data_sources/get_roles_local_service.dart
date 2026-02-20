import 'package:care_desk/src/Core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/params/local_params.dart';

class GetRolesLocalService extends DataBaseServiceInterface {
  static final GetRolesLocalService instance = GetRolesLocalService._();
  GetRolesLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.fetch,
      table: TablesNames.rolesUsersTable,
      params: params,
      showLoading: false,
    );
  }
}
