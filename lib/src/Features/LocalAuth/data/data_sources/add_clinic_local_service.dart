import 'package:care_desk/Src/core/LocalDataBaseStructure/enum/crud_opertion_enum.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/clinic_tables.dart';
import 'package:care_desk/src/Core/params/local_params.dart';
import 'package:care_desk/src/Features/LocalAuth/data/models/clinic_model.dart';

class AddClinicLocalService extends DataBaseServiceInterface<ClinicModel> {
  static final AddClinicLocalService instance = AddClinicLocalService._();
  AddClinicLocalService._();

  @override
  Future<LocalResponse> applyDataBaseService({LocalParams? params}) {
    return super.call(
      ActionType.insert,
      table: ClinicTables.clinicsTable,
      params: params,
      showLoading: true,
    );
  }
}
