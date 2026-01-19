import 'package:care_desk/src/Shared/Entities/title_interface.dart';

class RolesModel extends TitleInterface {
  @override
  final int id;
  final String role;
  final bool isActive;

  RolesModel({
    required this.id,
    this.isActive = true,
    required this.role,
  }) : super(
          id: id,
          title: role,
        );

  factory RolesModel.fromJson(Map<String, dynamic> json) {
    return RolesModel(
      id: json['id'],
      role: json['role_name'],
      isActive: json['is_active'] == 1,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'role_name': role,
  //     'is_active': isActive ? 1 : 0, // تحويل bool إلى 1 و 0
  //   };
  // }

  static List<RolesModel> data = [
    RolesModel(id: 1, role: 'Admin', isActive: true),
    RolesModel(id: 2, role: 'User', isActive: true),
    RolesModel(id: 3, role: 'Guest', isActive: true),
  ];
}
