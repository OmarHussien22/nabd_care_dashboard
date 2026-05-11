import 'package:care_desk/src/Features/Roles/data/models/permission_model.dart';
import 'package:care_desk/src/Features/Roles/data/models/role_model.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Features/Users/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

class UserModel {
  int id;
  String name;
  String email;
  String? avatar;
  List<RoleEntity> roles;
  List<PermissionEntity> permissions;
  String apiToken;
  int userTypeId;

  String? phone;
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
    required this.id,
    required this.name,
    required this.email,
    required this.apiToken,
    this.avatar,
    this.phone,
    this.isPhoneVerify,
    this.code,
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
    this.permissions = const [],
    this.roles = const [],
    required this.userTypeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'api_token': apiToken,
      'is_verified': isPhoneVerify,
      'image': avatar,
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
      'user_type_id': userTypeId,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.parseInt('id'),
      name: json.parseString('name'),
      phone: json.parseString('phone'),
      apiToken: json.parseString('api_token'),
      isPhoneVerify: json.parseBool('is_verified'),
      avatar: json.parseString('image'),
      code: json.parseString('code'),
      email: json.parseString('email'),
      isBlocked: json.parseBool('is_blocked'),
      isActive: json.parseBool('is_active'),
      address: json.parseString('address'),
      deviceToken: json.parseString('device_token'),
      deviceId: json.parseString('device_id'),
      deviceType: json.parseString('device_type'),
      version: json.parseString('version'),
      isApproved: json.parseBool('is_approved'),
      permissions: (json['permissions'] as List? ?? [])
          .map((e) => PermissionModel.fromJson(e))
          .toList(),
      roles: (json['roles'] as List? ?? [])
          .map((e) => RoleModel.fromJson(e))
          .toList(),
      userTypeId: json.parseInt('user_type_id'),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        apiToken,
        isPhoneVerify,
        avatar,
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

  Map<String, dynamic> toJson() => toMap();

  static UserModel get devUser => UserModel(
        id: 1,
        name: 'Admin',
        email: 'admin@gmail.com',
        avatar:
            'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839653_LxRKJopMjofmvbVYIHAjjUhxfqApStEa.jpg',
        roles: [RoleEntity.devRole],
        permissions: [PermissionEntity.devPermission],
        apiToken: 'dev_api_token',
        userTypeId: 1,
      );
}
