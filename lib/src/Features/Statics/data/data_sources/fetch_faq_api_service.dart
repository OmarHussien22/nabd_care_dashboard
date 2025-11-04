//
//
import 'package:dio/dio.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';


class FetchFaqApiService extends ServicesInterface {
  FetchFaqApiService._();
  static final FetchFaqApiService instance = FetchFaqApiService._();
  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLFetchFaq,
      type: CrudType.get,
    );
  }
}
