import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

import 'package:care_desk/src/core/network_structure/params/params.dart';

class CheckVerificationCodeParams extends Params {
  String phone;
  String? verificationCode;
  String? deviceId;

  CheckVerificationCodeParams({
    required this.phone,
    this.deviceId,
    this.verificationCode,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'device_id': deviceId,
      'verification_code': verificationCode,
    }.removeNullValues;
  }
}
