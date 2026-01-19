import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:care_desk/src/Features/LocalAuth/data/data_sources/add_clinic_local_service.dart';

class AddClinicLocalRepo extends LocalRepoInterface<int> {
  AddClinicLocalRepo._();
  static final instance = AddClinicLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      AddClinicLocalService.instance;

  @override
  // TODO: implement responseType
  ResponseType get responseType => ResponseType.withData;

  @override
  int Function(dynamic data) get onParse => (data) {
        return data as int; // Assuming insert returns ID
      };
}
