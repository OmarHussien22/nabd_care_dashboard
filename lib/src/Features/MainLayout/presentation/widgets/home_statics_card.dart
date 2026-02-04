// import 'package:flutter/material.dart';
// import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
// import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

// class HomeStaticsCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String value;
//   final Color color;
//   const HomeStaticsCard(
//       {super.key,
//       required this.title,
//       required this.icon,
//       required this.value,
//       required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.toRad()),
//       decoration: BoxDecoration(
//         color: AppColors.get.white,
//         borderRadius: BorderRadius.circular(12.toRad()),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.get.black.withValues(alpha: 0.1),
//             blurRadius: 8,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(icon, size: 35.toRad(), color: color),
//               Spacer(),
//               CustomText(
//                 title,
//                 fontWeight: FW.semiBold,
//                 fontSize: 5,
//               ),
//             ],
//           ),
//           5.ESH(),
//           CustomText(
//             value,
//             fontWeight: FW.regular,
//             fontSize: 5,
//           ),
//         ],
//       ),
//     );
//   }
// }
