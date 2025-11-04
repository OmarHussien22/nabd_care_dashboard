import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:getx_base_code/src/Core/params/local_params.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/models/local_user_model.dart';

class RegisterUserLocalService
    extends DataBaseServiceInterface<LocalUserModel> {
  static final RegisterUserLocalService instance = RegisterUserLocalService._();
  RegisterUserLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.insert,
      table: TablesNames.usersTable,
      params: params,
      showLoading: true,
    );
  }
}
