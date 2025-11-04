import 'package:getx_base_code/src/Core/Utils/Extensions/basic_op_extensions.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class ResetPasswordParams extends Params {
  String phone;
  String password;

  ResetPasswordParams({
    required this.phone,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    }.removeNullValues;
  }
}
