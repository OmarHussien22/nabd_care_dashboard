import 'package:care_desk/src/Core/network_structure/params/params.dart';
import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

class RegisterParams extends Params {
  String phone;
  String? parentPhone;
  String password;
  String name;
  String? parentName;
  String? deviceToken;
  String? deviceId;
  String? deviceType;
  String? version;
  String? email;
  String? address;
  String? countryCode;
  bool? isRealDevice;

  RegisterParams(
      {required this.phone,
      required this.parentPhone,
      required this.password,
      required this.name,
      required this.parentName,
      this.deviceToken,
      this.deviceId,
      this.deviceType,
      this.address,
      this.email,
      this.countryCode,
      this.version,
      this.isRealDevice});

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      if (parentPhone != null) 'parent_phone': parentPhone,
      'password': password,
      'name': name,
      if (parentName != null) 'parent_name': parentName,
      'device_token': deviceToken,
      'device_id': deviceId,
      'device_name': deviceType,
      'version': version,
      'is_real_device': isRealDevice,
      if (email != null && email != "") 'email': email,
      if (address != null && address != "") 'address': address,
      if (countryCode != null && countryCode != "") 'country_code': countryCode,
      if (deviceType != null) 'device_type': deviceType,
    }.removeNullValues;
  }
}
