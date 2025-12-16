// import 'package:flutter/material.dart';
// import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
// import 'package:care_desk/src/Core/Utils/general_utils.dart';
// import 'package:care_desk/src/Core/Utils/utils.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
//  import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/spaces.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
// import 'package:get/get.dart';
// Offset position = const Offset(20.0, 20.0);
// class DraggableFloatingActionButton extends StatelessWidget {
//
//   const DraggableFloatingActionButton(
//       {
//         Key? key,
//       }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(builder: (context, setState) {
//       return Positioned(
//           left: position.dx,
//           top: position.dy,
//           child: Draggable(
//               child: Stack(
//                 children: [
//                   Visibility(
//                     visible: true,
//                     replacement: AnimatedWrapper(
//                       child: ListView.builder(
//                         itemCount:  1,
//                         itemBuilder: (context, index) {
//
//                            return Row(
//                             children: [
//                               Image.asset(
//                                 Assets.noNotifications,
//
//                                 scale: 4,
//                               ),
//                               XSpace.light,
//                               CustomText.subtitle(
//                                 "controller.markers[index].infoWindow.title!",
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     child: FloatingActionButton(
//                       backgroundColor: AppColors.get.primary,
//                       child: const ImageIcon(
//                         const AssetImage(Assets.audio),
//                       ),
//                       onPressed: () {
//                         Get.dialog(
//                           Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Center(
//                               child: Dialog(
//                                 backgroundColor: Colors.transparent,
//                                 elevation: 0.0,
//                                 child: AnimatedWrapper(
//                                   child: ListView.builder(
//                                     itemCount: 12,
//                                     shrinkWrap: true,
//                                     itemBuilder: (context, index) {
//
//
//                                       return Row(
//                                         children: [
//                                           Image.asset(
//                                             Assets.search,
//                                             scale: 4,
//                                           ),
//                                           XSpace.light,
//                                           CustomText.subtitle(
//                                              "testtt"
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   CustomText.subtitle(
//                     "x  ",
//                     padding: EdgeInsets.all(5.0),
//                     color: AppColors.get.white,
//                   ),
//                 ],
//               ),
//               feedback: FloatingActionButton(
//                 backgroundColor: AppColors.get.primary.withOpacity(0.7),
//                 child:   ImageIcon(
//                   AssetImage(Assets.audio ),
//                 ),
//                 onPressed: () {},
//               ),
//               childWhenDragging: SizedBox.shrink(),
//               onDragEnd: (details) {
//                 setState(() {
//                   position = details.offset;
//                 });
//                 printDM("position=>$position");
//                 printDM("position=>${position.dx}");
//                 printDM("position=>${position.dy}");
//               }));
//     });
//   }
// }
