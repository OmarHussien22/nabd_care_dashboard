// import 'package:getx_base_code/src/Core/Utils/Extensions/basic_op_extensions.dart';
// import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:getx_base_code/src/Features/Auth/data/models/educational_information.dart';
// import 'package:getx_base_code/src/Features/Auth/presentation/manger/subjects_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../Core/Constants/Strings/Assets/app_icons.dart';
// import '../../../../Core/Styles/Colors/app_colors.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/button_close.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_outlined_button.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/generic_image_lib.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/options/image_options.dart';
// import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

// class CardFallingSubjects extends StatelessWidget {
//   final List<EducationInformation> subjects;

//   const CardFallingSubjects({
//     super.key,
//     required this.subjects,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(SubjectsController());
//     return GetBuilder<SubjectsController>(
//       builder: (_) {
//         return Column(
//           children: [
//             Row(
//               children: [
//                 CustomText.light(
//                   'have_failing_subjects',
//                   fontSize: 12,
//                   padding: EdgeInsets.only(top: 24.toH(), bottom: 16.toH()),
//                 ),
//                 // if (_.selectedSubjects.isNotEmpty)
//                 if (_.hasFailingSubjects.toBool) ...[
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       _.openSubjectsSelectionSheet(subjects: subjects);
//                     },
//                     child: ImageGeneric.asset(
//                       url: AppIcons.edit,
//                       options: ImageOptions(
//                         width: 24.toW(),
//                         height: 24.toH(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//             Visibility(
//               visible: _.selectedSubjects.isEmpty,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomOutlinedButton(
//                     title: 'yes',
//                     titleColor: _.hasFailingSubjects.toBool
//                         ? AppColors.get.primary
//                         : AppColors.get.grey,
//                     primaryColor: _.hasFailingSubjects.toBool
//                         ? AppColors.get.primary
//                         : AppColors.get.greyLight,
//                     onPressed: () {
//                       _.setHasFailingSubjects(true,
//                           // onSelect: _.openSubjectsSelectionSheet,
//                           onSelect: () {
//                         // TODO : insert subjects to subject controller
//                         _.openSubjectsSelectionSheet(subjects: subjects);
//                       });
//                     },
//                   ),
//                   16.ESW(),
//                   CustomOutlinedButton(
//                     title: 'no',
//                     titleColor: _.hasFailingSubjects == 0
//                         ? AppColors.get.primary
//                         : AppColors.get.grey,
//                     primaryColor: _.hasFailingSubjects == 0
//                         ? AppColors.get.primary
//                         : AppColors.get.greyLight,
//                     onPressed: () {
//                       _.setHasFailingSubjects(false);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             if (_.selectedSubjects.isNotEmpty)
//               Container(
//                 margin: EdgeInsets.only(top: 16.toH()),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.toRad()),
//                   border: Border.all(
//                     color: AppColors.get.greyLight,
//                   ),
//                 ),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: _.selectedSubjects.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: CustomText(
//                         _.selectedSubjects[index].title,
//                         fontSize: 12,
//                         fontWeight: FW.regular,
//                       ),
//                       subtitle: _.selectedSubjects[index].subTitle != ''
//                           ? CustomText.light(
//                               _.selectedSubjects[index].subTitle.notNull)
//                           : null,
//                       trailing: ButtonClose(
//                         // color: Colors.grey.withOpacity(0.4),
//                         onTap: () {
//                           _.removeSubject(_.selectedSubjects[index].id);
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
