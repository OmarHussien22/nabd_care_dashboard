import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

import 'package:care_desk/src/core/network_structure/params/params.dart';

class SendVerificationCodeParams extends Params {
  String phone;
  String? deviceId;

  SendVerificationCodeParams({required this.phone, this.deviceId});

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'device_id': deviceId,
    }.removeNullValues;
  }
}
