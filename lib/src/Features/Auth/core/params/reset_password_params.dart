import 'package:care_desk/src/Core/Utils/Extensions/basic_op_extensions.dart';

import 'package:care_desk/src/core/network_structure/params/params.dart';

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
