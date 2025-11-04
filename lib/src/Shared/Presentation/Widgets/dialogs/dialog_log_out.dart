// import 'package:getx_base_code/src/Core/Constants/Decorations/app_shapes.dart';
// import 'package:getx_base_code/src/Core/Constants/Strings/Assets/app_icons.dart';
// import 'package:getx_base_code/src/Core/Libraries/snap/snap.dart';
// import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
// import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/manger/logout_controller.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/pages/auth_pages_imports.dart';
// import 'package:getx_base_code/src/Shared/Caches/user_cache.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../../../../Core/Libraries/snap/src/snap_main.dart';
// import '../GeneralWidgets/Image/generic_image/generic_image.dart';
// import '../GeneralWidgets/Text/src/Options/imports_text_options.dart';
// import '../GeneralWidgets/Text/src/imports_text.dart';
//
// class DialogLogOut extends StatelessWidget {
//   const DialogLogOut({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: AppShapes.dialogShape,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 32.toH(), horizontal: 32.toW()),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 107.toW(),
//               height: 107.toH(),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.get.primaryLighter,
//               ),
//               child: Center(
//                   child: ImageGeneric.asset(
//                 url: AppIcons.exit,
//                 options: ImageOptions(width: 62.toW(), height: 62.toH()),
//               )),
//             ),
//             36.ESH(),
//             const CustomText(
//               'want_sign_out',
//               fontSize: 20,
//               fontWeight: FW.bold,
//             ),
//             8.ESH(),
//             CustomText(
//               'cant_back',
//               fontSize: 15,
//               fontWeight: FW.regular,
//               color: AppColors.get.subTitle,
//             ),
//             24.ESH(),
//             Row(
//               children: [
//                 Expanded(
//                   child: ButtonDefault(
//                     width: 30,
//                     height: 40,
//                     title: 'sure',
//                     onPressed: () {
//                       LogOutController logoutController = Get.put(LogOutController());
//                       logoutController.logOut();
//                     },
//                   ),
//                 ),
//                 16.ESW(),
//                 Expanded(
//                   child: ButtonDefault(
//                     width: 30,
//                     height: 40,
//                     title: 'no',
//                     backgroundColor: AppColors.get.activeBackground,
//                     // borderColor: AppColors.get.primary,
//                     titleColor: AppColors.get.primary,
//                     onPressed: () {
//                       Snap.back();
//                     },
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
