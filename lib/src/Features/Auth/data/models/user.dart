// import 'package:getx_base_code/src/Core/Utils/Extensions/json_parsing_extension.dart';
// import 'package:getx_base_code/src/Core/Utils/Extensions/parser_extension.dart';
// import 'package:getx_base_code/src/Features/Auth/data/models/user_info.dart';
// import 'package:equatable/equatable.dart';

// class User with EquatableMixin {
//   int? id;
//   String? message;
//   String? name;
//   String? phone;
//   String? image;
//   String? parentName;
//   String? parentPhone;
//   String? apiToken;
//   String? verificationCode;
//   int? isVerified;
//   int? categoryId;
//   String? categoryTitle;
//   int? isInfoComplete;
//   UserInfo? userInfo;
//   int? type;
//   bool? isBlocked;
//   String? countryCode;
//   String? email;
//   String? address;
//   int? isDeviceEmulator;

//   User({
//     this.id,
//     this.name,
//     this.message,
//     this.phone,
//     this.image,
//     this.parentName,
//     this.parentPhone,
//     this.apiToken,
//     this.verificationCode,
//     this.isVerified,
//     this.categoryId,
//     this.categoryTitle,
//     this.isInfoComplete,
//     this.userInfo,
//     this.type,
//     this.isBlocked,
//     this.isDeviceEmulator,
//     this.countryCode,
//     this.email,
//     this.address,
//   });

//   User.fromJson(Map<String, dynamic> json) {
//     id = json.parseInt('id');
//     message = json.parseString('message');
//     name = json.parseString('name');
//     phone = json.parseString('phone');
//     image = json.parseString('image');
//     parentName = json.parseString('parent_name');
//     parentPhone = json.parseString('parent_phone');
//     apiToken = json.parseString('api_token');
//     verificationCode = json.parseString('verification_code');
//     isVerified = json.parseInt('is_verified');
//     categoryId = json.parseInt('category_id');
//     categoryTitle = json.parseString('category_title');
//     countryCode = json.parseString('country_code');
//     email = json.parseString('email');
//     address = json.parseString('address');
//     isInfoComplete = json.parseInt('is_info_complete');
//     userInfo =
//         json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
//     type = json.parseInt('type');
//     isBlocked = json.parseBool('is_blocked', defaultValue: false);
//     isDeviceEmulator = json.parseInt('is_device_emulator', defaultValue: 0);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'message': message,
//       'name': name,
//       'phone': phone,
//       'image': image,
//       'parent_name': parentName,
//       'parent_phone': parentPhone,
//       'api_token': apiToken,
//       'verification_code': verificationCode,
//       'is_verified': isVerified,
//       'category_id': categoryId,
//       'category_title': categoryTitle,
//       'is_info_complete': isInfoComplete,
//       'user_info': userInfo?.toJson(),
//       'type': type,
//       'is_blocked': isBlocked,
//       'is_device_emulator': isDeviceEmulator,
//       'country_code': countryCode,
//       'email': email,
//       'address': address,
//     };
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         message,
//         name,
//         phone,
//         image,
//         parentName,
//         parentPhone,
//         apiToken,
//         verificationCode,
//         isVerified,
//         categoryId,
//         categoryTitle,
//         isInfoComplete,
//         userInfo,
//         type,
//         isDeviceEmulator,
//         countryCode,
//         email,
//         address,
//       ];

//   static User example = User(
//     id: 1,
//     name: 'test',
//     phone: '01009060299',
//     image: 'https://www.w3schools.com/howto/img_avatar.png',
//     parentName: 'عبدالله محمد',
//     apiToken: '123456789',
//     categoryId: 1,
//     categoryTitle: 'طالب',
//     isVerified: 1,
//     parentPhone: '01000000000',
//     verificationCode: '123456',
//     isInfoComplete: 1,
//     type: 1,
//     userInfo: UserInfo(
//       id: 1,
//       basicEducationTypeId: 1,
//       stageId: 1,
//       yearId: 1,
//       universityEducationTypeId: 1,
//       universityId: 1,
//       collegeId: 1,
//       departmentId: 1,
//       divisionId: 1,
//       basicEducationTypeTitle: 'متوسط',
//       stageTitle: 'الصف الثالث الاعدادي',
//       yearTitle: 'الفصل الدراسي الاول',
//       universityEducationTypeTitle: 'جامعة حكومية',
//       universityTitle: 'جامعة القاهرة',
//       collegeTitle: 'كلية الحاسبات والمعلومات',
//       departmentTitle: 'علوم حاسب',
//       divisionTitle: 'الفرقة الثالثة',
//     ),
//   );
// }

// //
// //
// // class User extends Equatable {
// //   final int id;
// //   final String name;
// //   final String phone;
// //   final String parentName;
// //   final String parentPhone;
// //   final String profileImage;
// //   final String apiToken;
// //   final bool requirePhoneVerification;
// //   final bool isPhoneVerified;
// // //<editor-fold desc="Data Methods">
// //
// //   const User({
// //     required this.id,
// //     required this.name,
// //     required this.phone,
// //     required this.parentName,
// //     required this.parentPhone,
// //     required this.apiToken,
// //     required this.requirePhoneVerification,
// //     required this.isPhoneVerified,
// //      required this.profileImage,
// //   });
// //
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'name': name,
// //       'phone': phone,
// //       'parent_name': parentName,
// //       'parent_phone': parentPhone,
// //       'profile_image': profileImage,
// //       'api_token': apiToken,
// //       'require_phone_verification': requirePhoneVerification,
// //       'is_phone_verified': isPhoneVerified,
// //
// //     };
// //   }
// //
// //   factory User.fromJson(Map<String, dynamic> json) {
// //     return User(
// //       id: json.parseInt('id'),
// //       name: json.parseString('name'),
// //       phone: json.parseString('phone'),
// //       profileImage: json.parseString('profile_image'),
// //       parentName: json.parseString('parent_name'),
// //       parentPhone: json.parseString('parent_phone'),
// //       apiToken: json.parseString('api_token'),
// //       requirePhoneVerification: json.parse<bool>('require_phone_verification'),
// //       isPhoneVerified: json.parse<bool>('is_phone_verified'),
// //     );
// //   }
// //
// //
// //
// //
// //   @override
// //   // TODO: implement props
// //   List<Object?> get props => [
// //         id,
// //         name,
// //         phone,
// //         parentName,
// //         parentPhone,
// //         profileImage,
// //         apiToken,
// //         requirePhoneVerification,
// //          isPhoneVerified,
// //
// //       ];
// //
// //   User copyWith({
// //     int? id,
// //     String? name,
// //     String? phone,
// //     String? parentName,
// //     String? parentPhone,
// //     String? profileImage,
// //     String? apiToken,
// //     bool? requirePhoneVerification,
// //     bool? isPhoneVerified,
// //   }) {
// //     return User(
// //       id: id ?? this.id,
// //       name: name ?? this.name,
// //       phone: phone ?? this.phone,
// //       parentName: parentName ?? this.parentName,
// //       parentPhone: parentPhone ?? this.parentPhone,
// //       profileImage: profileImage ?? this.profileImage,
// //       apiToken: apiToken ?? this.apiToken,
// //       requirePhoneVerification: requirePhoneVerification ?? this.requirePhoneVerification,
// //       isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
// //     );
// //   }
// //   static User example = const User(
// //     id: 1,
// //     name: "Ahmed",
// //     phone: "01000000000",
// //     parentName: "Mohamed",
// //     apiToken: "token",
// //     parentPhone: "01000000000",
// //     requirePhoneVerification: false,
// //     isPhoneVerified: true,
// //     profileImage: "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
// //   );
// //
// // }
