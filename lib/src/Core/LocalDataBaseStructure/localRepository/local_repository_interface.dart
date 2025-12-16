import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/respons/respons_local_data_base.dart';
import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/params/local_params.dart';

import '../localDataSource/interfaces/data_base_service_interface.dart';

enum ResponseType {
  withData,
  withoutData,
}

abstract class LocalRepoInterface<T> {
  DataBaseServiceInterface get databaseServiceInstance;

  ResponseType get responseType => ResponseType.withData;

  bool get hasPagination => false;

  T Function(dynamic data) get onParse;

  Future<DataState<T>>? call({LocalParams? params}) async {
    printDM('RepoInterface call');
    try {
      final response = await databaseServiceInstance.applyDataBaseService(
        params: params,
      );
      //  final checkResponse = response.statusCode == 200;
      if (responseType == ResponseType.withoutData) {
        return DataSuccess<T>(onParse(response.data),
            message: response.statusMessage);
      }
      return DataSuccess<T>(onParse(response.data));
        } catch (e) {
      printDM('RepoInterface call error: $e');
      return DataFailed(
        ErrorModel(
          title: 'حدث خطأ أثناء جلب البيانات: $e',
          message: LocalResponse().statusMessage,
          type: ErrorType.unKnown,
        ),
      );
    }
  }
}
