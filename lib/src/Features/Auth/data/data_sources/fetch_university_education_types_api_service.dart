import 'package:dio/dio.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

//<editor-fold desc="Service">
class FetchUniversityEducationTypesApiService extends ServicesInterface {
  FetchUniversityEducationTypesApiService._();

  factory FetchUniversityEducationTypesApiService() => _instance;
  static final FetchUniversityEducationTypesApiService _instance =
      FetchUniversityEducationTypesApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLFetchUniversityEducationTypes",
      type: CrudType.get,
      showLoadingDialog: false,
    );
  }
}
//</editor-fold>
