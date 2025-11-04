import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class FetchAppInfoApiService extends ServicesInterface {
  FetchAppInfoApiService._();
  static final FetchAppInfoApiService instance = FetchAppInfoApiService._();
  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchSettings,
      type: CrudType.get,
    );
  }
}
