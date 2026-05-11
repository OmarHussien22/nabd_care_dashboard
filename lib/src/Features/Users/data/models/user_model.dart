// import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
// import 'package:care_desk/src/Features/Roles/data/models/role_model.dart';
// import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
// import '../../domain/entities/user_entity.dart';

// class UserModel extends UserEntity {
//   const UserModel({
//     required super.id,
//     required super.name,
//     required super.email,
//     super.avatar,
//     super.roles,
//     super.permissions,
//     required super.apiToken,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json.parseInt('id') ?? 0,
//       name: json.parseString('name') ?? '',
//       email: json.parseString('email') ?? '',
//       avatar: json.parseString('image') ?? json.parseString('avatar'),
//       roles: json.parseList('roles', RoleModel.fromJson).toList(),
//       permissions:
//           json.parseList('permissions', PermissionModel.fromJson).toList(),
//       apiToken: json.parseString('api_token') ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'email': email,
//         'avatar': avatar,
//         'api_token': apiToken,
//       };

//   static UserModel get devUser => UserModel(
//         id: 1,
//         name: 'Admin',
//         email: 'admin@gmail.com',
//         avatar:
//             'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839653_LxRKJopMjofmvbVYIHAjjUhxfqApStEa.jpg',
//         roles: [RoleEntity.devRole],
//         permissions: [PermissionEntity.devPermission],
//         apiToken: 'dev_api_token',
//       );
// }
