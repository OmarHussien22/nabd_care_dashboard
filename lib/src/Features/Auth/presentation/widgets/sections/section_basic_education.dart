// part of '../../pages/auth_pages_imports.dart';

// class SectionBasicEducation extends StatelessWidget {
//   final bool isEdit;

//   const SectionBasicEducation({
//     Key? key,
//     this.isEdit = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final FetchBasicEducationTypesController controller =
//         Get.put(FetchBasicEducationTypesController(isEdit: isEdit));
//     return GetBuilder<FetchBasicEducationTypesController>(
//       init: controller,
//       builder: (_) {
//         return DataStatusBuilder(
//           status: _.state,
//           onDoneBuild: AnimatedWrapper(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Form(
//                     key: _.formKey,
//                     child: ListView(
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         AppFillTextFieldField(
//                           header: 'educational_level',
//                           hint: 'educational_level_hint',
//                           controller: _.educationLevelController,
//                           isSheet: true,
//                           onTap: () {
//                             AppSheets.get
//                                 .showSingleSelection<EducationInformation>(
//                               title: 'educational_level_hint',
//                               selectedId: _.selectedEducationLevelId,
//                               items: _.educationLevels,
//                               onSave: (value) {
//                                 _.setEducationLevelID(value);
//                                 Snap.back();
//                               },
//                             );
//                           },
//                         ),
//                         16.ESH(),
//                         AppFillTextFieldField(
//                           header: 'stage',
//                           hint: 'stage_hint',
//                           controller: _.educationStageController,
//                           isSheet: true,
//                           onTap: () {
//                             AppSheets.get
//                                 .showSingleSelection<EducationInformation>(
//                               title: 'stage_hint',
//                               selectedId: _.selectedEducationStageId,
//                               items: _.educationStages,
//                               onSave: (value) {
//                                 _.setEducationStage(value);
//                                 Get.back();
//                               },
//                             );
//                           },
//                         ),
//                         16.ESH(),
//                         AppFillTextFieldField(
//                           header: 'year',
//                           hint: 'year_hint',
//                           controller: _.educationYearController,
//                           isSheet: true,
//                           onTap: () {
//                             AppSheets.get
//                                 .showSingleSelection<EducationInformation>(
//                               title: 'year_hint',
//                               selectedId: _.selectedEducationYearId,
//                               items: _.educationYears,
//                               onSave: (value) {
//                                 _.setEducationYear(value);
//                                 Get.back();
//                               },
//                             );
//                           },
//                         ),
//                         16.ESH(),
//                         CardFallingSubjects(
//                           subjects: _.subjects,
//                         ),
//                         // Row(
//                         //   children: [
//                         //     CustomText.light(
//                         //       'have_failing_subjects',
//                         //       fontSize: 12,
//                         //       padding: EdgeInsets.only(
//                         //           top: 24.toH(), bottom: 16.toH()),
//                         //     ),
//                         //     // if (_.selectedSubjects.isNotEmpty)
//                         //     if (_.hasFailingSubjects.toBool) ...[
//                         //       const Spacer(),
//                         //       GestureDetector(
//                         //         onTap: _.openSubjectsSelectionSheet,
//                         //         child: ImageGeneric.asset(
//                         //           url: AppIcons.edit,
//                         //           options: ImageOptions(
//                         //             width: 24.toW(),
//                         //             height: 24.toH(),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ],
//                         // ),
//                         // Visibility(
//                         //   visible: _.selectedSubjects.isEmpty,
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.start,
//                         //     children: [
//                         //       CustomOutlinedButton(
//                         //         title: 'yes',
//                         //         titleColor: _.hasFailingSubjects.toBool
//                         //             ? AppColors.get.primary
//                         //             : AppColors.get.grey,
//                         //         primaryColor: _.hasFailingSubjects.toBool
//                         //             ? AppColors.get.primary
//                         //             : AppColors.get.greyLight,
//                         //         onPressed: () {
//                         //           _.setHasFailingSubjects(
//                         //             true,
//                         //             onSelect: _.openSubjectsSelectionSheet,
//                         //           );
//                         //         },
//                         //       ),
//                         //       16.ESW(),
//                         //       CustomOutlinedButton(
//                         //         title: 'no',
//                         //         titleColor: _.hasFailingSubjects == 0
//                         //             ? AppColors.get.primary
//                         //             : AppColors.get.grey,
//                         //         primaryColor: _.hasFailingSubjects == 0
//                         //             ? AppColors.get.primary
//                         //             : AppColors.get.greyLight,
//                         //         onPressed: () {
//                         //           _.setHasFailingSubjects(false);
//                         //         },
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // if (_.selectedSubjects.isNotEmpty)
//                         //   Container(
//                         //     margin: EdgeInsets.only(top: 16.toH()),
//                         //     decoration: BoxDecoration(
//                         //       borderRadius: BorderRadius.circular(8.toRad()),
//                         //       border: Border.all(
//                         //         color: AppColors.get.greyLight,
//                         //       ),
//                         //     ),
//                         //     child: ListView.builder(
//                         //       shrinkWrap: true,
//                         //       physics: const NeverScrollableScrollPhysics(),
//                         //       itemCount: _.selectedSubjects.length,
//                         //       itemBuilder: (context, index) {
//                         //         return ListTile(
//                         //           title: CustomText(
//                         //             _.selectedSubjects[index].title,
//                         //             fontSize: 12,
//                         //             fontWeight: FW.regular,
//                         //           ),
//                         //           subtitle:
//                         //               _.selectedSubjects[index].subTitle != ''
//                         //                   ? CustomText.light(_
//                         //                       .selectedSubjects[index]
//                         //                       .subTitle
//                         //                       .notNull)
//                         //                   : null,
//                         //           trailing: ButtonClose(
//                         //             onTap: () {
//                         //               _.removeSubject(
//                         //                   _.selectedSubjects[index].id);
//                         //             },
//                         //           ),
//                         //         );
//                         //       },
//                         //     ),
//                         //   ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ButtonFooter(
//                   title: isEdit ? 'edit_info' : 'start_now',
//                   // isDisabled: _.isButtonDisabled,
//                   onPressed: () {
//                     _.submitEducationInfo();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
