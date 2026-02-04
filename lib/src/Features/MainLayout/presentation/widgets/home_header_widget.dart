// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:care_desk/src/Core/Styles/Themes/theme_switch_button.dart';
// import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
// import 'package:care_desk/src/Shared/Caches/user_cache_local.dart';
// import 'package:care_desk/src/Shared/Managers/user_local_controller.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';


// class HomeHeaderWidget extends StatelessWidget {
//   const HomeHeaderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomText(
//           "home",
//           fontWeight: FW.semiBold,
//           fontSize: 8,
//         ),
//         Row(
//           children: [
//             Row(
//               children: [
//                 const CustomText(
//                   "hello,",
//                   fontSize: 5,
//                 ),
//                 CustomText(
//                   UserLocalController.get.user!.name ?? "",
//                   fontSize: 5,
//                 ),
//               ],
//             ),
//             4.ESW(),
//             IconButton(
//               icon: const Icon(Icons.logout, color: Colors.red),
//               onPressed: () {
//                 UserCacheLocal.instance.logout();
//                 Get.offAll(() => LoginPage(),
//                     duration: const Duration(milliseconds: 500),
//                     transition: Transition.fadeIn);
//                // ClientSnacks.logoutSuccess();
//               },
//             ),
//             4.ESW(),
//             ThemeSwitchButton(),
//           ],
//         ),
//       ],
//     );
//   }
// }
