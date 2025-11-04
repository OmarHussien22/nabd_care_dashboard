import 'package:dio/dio.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

//<editor-fold desc="Service">
class FetchBasicEducationTypesApiService extends ServicesInterface {
  FetchBasicEducationTypesApiService._();

  factory FetchBasicEducationTypesApiService() => _instance;
  static final FetchBasicEducationTypesApiService _instance = FetchBasicEducationTypesApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLFetchBasicEducationTypes",
      type: CrudType.get,
      auth: false,
      params: params,
      showLoadingDialog: false,
    );
  }
}
//</editor-fold>
