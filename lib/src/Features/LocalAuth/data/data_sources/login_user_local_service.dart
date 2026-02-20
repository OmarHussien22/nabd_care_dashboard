import 'package:care_desk/src/Core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/params/local_params.dart';

class LoginUserLocalService extends DataBaseServiceInterface {
  static final LoginUserLocalService instance = LoginUserLocalService._();
  LoginUserLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.fetch,
      table: TablesNames.usersTable,
      params: params,
      where: "phone = ? AND password = ? AND is_active = 1",
      showLoading: true,
      isGetSingleResponse: true,
    );
  }
}
