// import 'package:getx_base_code/src/Core/Libraries/snap/snap.dart';
// import 'package:getx_base_code/src/Features/Auth/data/models/educational_information.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/Builders/custom_scaffold.dart';
// import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Sheets/app_Sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../Core/Constants/Decorations/app_Insets.dart';
// import '../../../Core/Styles/Colors/app_colors.dart';
// import '../../../Core/Utils/Extensions/screen_spaces_extension.dart';
// import '../../../Shared/Presentation/Widgets/AppBars/app_bars.dart';
// import '../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
// import '../manger/complete_data_controller.dart';
// import 'auth_pages_imports.dart';

// class CompleteDataPage extends StatelessWidget {
//   final bool isEdit;
//   const CompleteDataPage({
//     super.key,
//     this.isEdit = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final node = FocusScope.of(context);
//     final controller = Get.put(CompleteDataController());
//     return CustomScaffold(
//       appBar: AppBars.basic(
//         title: 'educational_info',
//         arrowBackColor: AppColors.get.black,
//         isBack: isEdit ? true : false,
//       ),
//       body: GetBuilder<CompleteDataController>(
//         init: controller,
//         builder: (_) {
//           return Form(
//             key: _.formKey,
//             child: Padding(
//               padding: AppInsets.defaultScreenALL,
//               child: Column(
//                 children: [
//                   AppFillTextFieldField(
//                     header: 'educational_type',
//                     hint: 'educational_type_hint',
//                     controller: _.educationalTypeController,
//                     isSheet: true,
//                     onTap: () {
//                       AppSheets.get.showSingleSelection<EducationInformation>(
//                         title: 'educational_type',
//                         selectedId: _.selectedEducationTypeID,
//                         // items: EducationInformation.educationTypes,
//                         items: _.educationTypeList(),

//                         onSave: (value) {
//                           _.setSelectedEducationTypeID(value);
//                           Snap.back();
//                         },
//                       );
//                     },
//                   ),
//                   16.ESH(),
//                   if (_.selectedEducationTypeID == 1) ...[
//                     Expanded(
//                         child: SectionBasicEducation(
//                       isEdit: isEdit,
//                     )),
//                   ],

//                   /// TODO : Education University
//                   if (_.selectedEducationTypeID == 2) ...[
//                     Expanded(
//                         child: SectionUniversityEducation(
//                       isEdit: isEdit,
//                     )),
//                   ],
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
