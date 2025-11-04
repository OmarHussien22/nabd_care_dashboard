import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchServicesApiService extends ServicesInterface {
  FetchServicesApiService._();

  static final FetchServicesApiService instance = FetchServicesApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLFetchServices",
      type: CrudType.get,
    );
  }
}
