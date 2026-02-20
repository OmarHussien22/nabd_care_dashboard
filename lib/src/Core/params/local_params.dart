import 'package:care_desk/src/core/network_structure/params/params.dart';

abstract class LocalParams extends Params {
  @override
  Map<String, dynamic> toJson();
}
