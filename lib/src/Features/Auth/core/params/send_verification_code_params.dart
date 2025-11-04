import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

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
