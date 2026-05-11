import 'package:dio/dio.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';

abstract class ServiceCaller {
  Future<Response> applyService({Params? params});
}
