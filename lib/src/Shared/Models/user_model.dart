import 'package:equatable/equatable.dart';
import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

class UserModel with EquatableMixin {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? apiToken;
  String? image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewPdubiwZ-wA40RGuCnUu-IBIkj3iSCGGd6s5Hf7Q&s";
  bool? isPhoneVerify;
  String? code;
  String? userType;
  String? birthDay;
  String? gender;
  String? country;
  String? city;
  String? countryCode;
  bool? isBlocked;
  String? verificationCode;
  bool? isActive;
  String? address;
  String? deviceToken;
  String? deviceId;
  String? deviceType;
  String? version;
  bool? isApproved;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.apiToken,
    this.isPhoneVerify,
    this.image,
    this.code,
    this.email,
    this.userType,
    this.birthDay,
    this.gender,
    this.country,
    this.city,
    this.countryCode,
    this.isBlocked,
    this.verificationCode,
    this.isActive,
    this.address,
    this.deviceToken,
    this.deviceId,
    this.deviceType,
    this.version,
    this.isApproved,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'api_token': apiToken,
      'is_verified': isPhoneVerify,
      'image': image,
      'code': code,
      'email': email,
      'user_type': userType,
      'birth_day': birthDay,
      'verification_code': verificationCode,
      'is_blocked': isBlocked,
      'country': country,
      'city': city,
      'country_code': countryCode,
      'gender': gender,
      'is_active': isActive,
      'address': address,
      'device_token': deviceToken,
      'device_id': deviceId,
      'device_type': deviceType,
      'version': version,
      'is_approved': isApproved,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    printDM("************UserModel.fromMap(map)************");
    id = json.parseInt('id');
    printDM("id => $id ");
    name = json.parseString('name');
    printDM("name => $name ");
    phone = json.parseString('phone');
    printDM("phone => $phone ");
    apiToken = json.parseString('api_token');
    printDM("api_token => $apiToken ");
    isPhoneVerify = json.parseBool('is_verified');
    printDM("is_phone_verify => $isPhoneVerify ");
    image = json.parseString('image');
    printDM("image => $image");
    code = json.parseString('code');
    printDM("code => $code");
    email = json.parseString('email');
    printDM("email => $email");
    isBlocked = json.parseBool('is_blocked');
    printDM("isBlocked => $isBlocked");
    isActive = json.parseBool('is_active');
    printDM("isActive => $isActive");
    address = json.parseString('address');
    printDM("address => $address");
    deviceToken = json.parseString('device_token');
    printDM("deviceToken => $deviceToken");
    deviceId = json.parseString('device_id');
    printDM("deviceId => $deviceId");
    deviceType = json.parseString('device_type');
    printDM("deviceType => $deviceType");
    version = json.parseString('version');
    printDM("version => $version");
    isApproved = json.parseBool('is_approved');
    printDM("isApproved => $isApproved");
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        apiToken,
        isPhoneVerify,
        image,
        code,
        email,
        userType,
        gender,
        birthDay,
        country,
        city,
        countryCode,
        isBlocked,
        verificationCode,
        isActive,
        address,
        deviceToken,
        deviceId,
        deviceType,
        version,
        isApproved,
      ];
}
