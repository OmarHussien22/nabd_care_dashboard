import 'package:getx_base_code/Src/core/LocalDataBaseStructure/constants/tables_names.dart';
import 'package:getx_base_code/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';

import '../../../../Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import '../../../../Core/params/local_params.dart';

class AddProductLocalService extends DataBaseServiceInterface {
  static final AddProductLocalService instance = AddProductLocalService._();
  AddProductLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.insert,
      table: TablesNames.productsTable,
      params: params,
      showLoading: true,
    );
  }
}
