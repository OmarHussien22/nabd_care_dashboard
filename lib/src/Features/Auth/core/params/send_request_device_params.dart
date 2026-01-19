import 'package:care_desk/src/Core/Utils/Extensions/basic_op_extensions.dart';

import '../../../../Core/NetworkStructure/Params/params.dart';

class SendRequestDeviceParams extends Params {
  String phone;
  String? name;
  String? deviceId;
  String? deviceName;
  String? deviceType;
  String? deviceBrand;

  SendRequestDeviceParams({
    required this.phone,
    this.name,
    this.deviceId,
    this.deviceType,
    this.deviceBrand,
    this.deviceName,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'device_id': deviceId,
      'device_name': deviceName,
      'device_type': deviceType,
      'device_brand': deviceBrand
    }.removeNullValues;
  }
}
