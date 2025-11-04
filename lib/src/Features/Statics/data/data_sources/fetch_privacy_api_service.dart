
import 'package:dio/dio.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';


class FetchPrivacyApiService extends ServicesInterface{
  FetchPrivacyApiService._();
  static final FetchPrivacyApiService instance = FetchPrivacyApiService._();
  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
        uRLFetchPrivacy,
        type: CrudType.get);
  }
}