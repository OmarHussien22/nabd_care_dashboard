import 'package:care_desk/src/core/network_structure/params/params.dart';
import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

class LoginParams extends Params {
  String phone;
  String password;
  String? deviceToken;
  String? deviceId;
  String? deviceType;
  String? version;
  String? countryCode;
  bool? isRealDevice;
  int? isVisitor;
  LoginParams(
      {required this.phone,
      required this.password,
      this.deviceToken,
      this.deviceId,
      this.deviceType,
      this.version,
      this.isVisitor,
      this.countryCode,
      this.isRealDevice});

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'device_token': deviceToken,
      'device_id': deviceId,
      "device_name": deviceType,
      "version": version,
      "is_real_device": isRealDevice,
      "country_code": countryCode,
      if (deviceType != null) "device_type": deviceType,
      "is_visitor": isVisitor
    }.removeNullValues;
  }
}
