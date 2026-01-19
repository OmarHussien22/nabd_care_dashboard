import 'package:care_desk/src/Core/NetworkStructure/Params/params.dart';

abstract class LocalParams extends Params {
  @override
  Map<String, dynamic> toJson();
}
