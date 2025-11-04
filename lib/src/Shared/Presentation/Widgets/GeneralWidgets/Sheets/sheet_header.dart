//  import 'package:flutter/material.dart';
// import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
// import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/sheet_indicator.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
// import 'package:get/get.dart';
//
//
//
// /// WRAP Sheet child with this header
// class SheetHeader extends StatelessWidget {
//   final Widget sheetBody;
//   final bool isDismissible;
//    final bool showIndicator ;
//   final bool enableDrag;
//
//   final String title;
//   final VoidCallback? onSavePress;
//   final String? onSaveTitle;
//
//   const SheetHeader({
//     Key? key,
//     required this.sheetBody,
//     this.onSavePress,
//     this.onSaveTitle,
//     this.title = "",
//     this.enableDrag = true,
//     this.isDismissible = true, this.showIndicator=true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if(showIndicator)  const SheetIndicator(),
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: 10.0.toW(), vertical: showIndicator?0:15.toH()),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               isDismissible ? const CloseButton() : const SizedBox(),
//               CustomText(
//                 title,
//                 fontWeight: FW.semiBold,
//                 padding: EdgeInsetsDirectional.only(
//                     end: isDismissible ? 20.toW() : 0.0,
//                     start: onSavePress != null ? 30.toW() : 0.0),
//               ),
//               (onSavePress != null)
//                   ? TextButton(
//                       onPressed: onSavePress,
//                       child: CustomText(
//                         onSaveTitle ?? "done".tr,
//                         fontSize: 16,
//                         fontWeight: FW.semiBold,
//                         color: AppColors.get.primary,
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//         XDivider.normal(verticalPadding: 5.0.toH()),
//         sheetBody,
//       ],
//     );
//   }
// }
