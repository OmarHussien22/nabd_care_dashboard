// import 'package:equatable/equatable.dart';

class LocalUserModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  int? roleId;
  bool? isActive;

  LocalUserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.roleId,
    this.isActive = true,
  });

  LocalUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    email = json['email'] ?? '';
    password = json['password'] ?? "";
    phone = json['phone'] ?? '';
    roleId = json['role_id'] ?? 0.toString();
    isActive = json['is_active'] == 1;
  }

  // factory LocalUserModel.fromJson(Map<String, dynamic> json) => LocalUserModel(
  //       id: json['id'] ?? 0,
  //       name: json['name'] ?? "",
  //       email: json['email'] ?? '',
  //       password: json['password'] ?? "",
  //       phone: json['phone'] ?? '',
  //       roleId: json['role_id'] ?? 0,
  //       isActive: json['is_active'] == 1,
  //     );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password, // هنشفرها لاحقًا
        'role_id': roleId,
        'is_active': isActive! ? 1 : 0,
      };

  // @override
  // // TODO: implement props
  // List<Object?> get props =>
  //     [id, name, email, password, phone, roleId, isActive];
}
