import 'package:dio/dio.dart';
import 'package:care_desk/src/Core/NetworkStructure/Params/params.dart';

abstract class ServiceCaller {
  Future<Response> applyService({Params? params});
}
