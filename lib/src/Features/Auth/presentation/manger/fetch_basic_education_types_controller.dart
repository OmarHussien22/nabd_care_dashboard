// import 'package:care_desk/src/Core/Utils/Extensions/basic_op_extensions.dart';
// import 'package:care_desk/src/Core/Utils/Validation/app_validator.dart';
// import 'package:care_desk/src/Core/Utils/general_utils.dart';
// import 'package:care_desk/src/Features/Auth/core/params/set_user_info_params.dart';
// import 'package:care_desk/src/Features/Auth/presentation/manger/set_user_info_controller.dart';
// import 'package:care_desk/src/Features/Auth/presentation/manger/subjects_controller.dart';
// import 'package:care_desk/src/Shared/Caches/user_cache.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
// import '../../../../Shared/Entities/title_interface.dart';
// import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
// import '../../data/models/educational_information.dart';
// import '../../domain/use_cases/fetch_basic_education_types_use_case.dart';

// //<editor-fold desc="Controller">
// class FetchBasicEducationTypesController
//     extends GetControllerInterface<List<EducationInformation>> {
//   int selectedEducationLevelId = -1;
//   int selectedEducationStageId = -1;
//   int selectedEducationYearId = -1;
//   final bool isEdit;

//   FetchBasicEducationTypesController({required this.isEdit});

//   late TextEditingController educationLevelController;
//   late TextEditingController educationStageController;
//   late TextEditingController educationYearController;

//   List<EducationInformation> educationLevels = [];
//   List<EducationInformation> educationStages = [];
//   List<EducationInformation> educationYears = [];
//   List<EducationInformation> subjects = [];

//   SubjectsController subjectsController = Get.put(SubjectsController());

//   void setEducationLevelID(EducationInformation value) {
//     selectedEducationLevelId = value.id;
//     printDM("selectedEducationLevelId: $selectedEducationLevelId");
//     educationLevelController.text = value.title;
//     int index = educationLevels.indexWhere((element) => element.id == value.id);
//     printDM("index: $index");
//     if (index > -1) {
//       educationStages =
//           educationLevels[index].children as List<EducationInformation>;
//     }
//     educationStageController.clear();
//     educationYearController.clear();
//     selectedEducationStageId = -1;
//     selectedEducationYearId = -1;
//     update();
//   }

//   void setEducationStage(EducationInformation value) {
//     selectedEducationStageId = value.id;
//     educationStageController.text = value.title;
//     int index = educationStages.indexWhere((element) => element.id == value.id);
//     if (index > -1) {
//       educationYears =
//           educationStages[index].children as List<EducationInformation>;
//     }
//     printDM("subjects: ${subjects.length}");
//     educationYearController.clear();
//     selectedEducationYearId = -1;

//     update();
//   }

//   void setEducationYear(EducationInformation value) {
//     selectedEducationYearId = value.id;
//     educationYearController.text = value.title;
//     int index = educationYears.indexWhere((element) => element.id == value.id);
//     if (index > -1) {
//       subjects = educationYears[index].children as List<EducationInformation>;
//     }
//     update();
//   }

//   /// _____ set education info _______
//   SetUserInfoController setUserInfoController =
//       Get.put(SetUserInfoController());
//   submitEducationInfo() async {
//     formValidator(
//       globalKey: formKey,
//       onSuccessValidate: () {
//         setUserInfoController.setUserInfo(
//           isEdit: isEdit,
//           setUserInfoParams: SetUserInfoParams(
//             categoryId: 1,
//             basicEducationTypeId: selectedEducationLevelId,
//             stageId: selectedEducationStageId,
//             yearId: selectedEducationYearId,
//             subjectIds:
//                 subjectsController.selectedSubjects.map((e) => e.id).toList(),
//           ),
//         );
//       },
//     );
//   }

//   final formKey = GlobalKey<FormState>();

//   ///
//   Future<void> fetchData() async {
//     emit(const DataLoading());
//     final state = await FetchBasicEducationTypesUseCase().call()!;
//     emit(state);
//     if (state is DataSuccess) {
//       educationLevels = state.data.notNull;
//       fillData(educationLevels);

//       if (isEdit) {
//         prepareData();
//       }
//     } else {
//       ClientSnacks.requestError(error: state.message);
//     }
//   }

//   // prepareData() {
//   //   if (UserCache().data != null) {
//   //     if (UserCache().data!.userInfo!.basicEducationTypeId != null) {
//   //       setEducationLevelID(EducationInformation(
//   //         id: UserCache().data!.userInfo!.basicEducationTypeId!,
//   //         title: UserCache().data!.userInfo!.basicEducationTypeTitle!,
//   //       ));
//   //     }
//   //     if (UserCache().data!.userInfo!.stageId != null) {
//   //       setEducationStage(EducationInformation(
//   //         id: UserCache().data!.userInfo!.stageId!,
//   //         title: UserCache().data!.userInfo!.stageTitle!,
//   //       ));
//   //     }
//   //     if (UserCache().data!.userInfo!.yearId != null) {
//   //       setEducationYear(EducationInformation(
//   //         id: UserCache().data!.userInfo!.yearId!,
//   //         title: UserCache().data!.userInfo!.yearTitle!,
//   //       ));
//   //     }
//   //     if (UserCache().data!.userInfo!.failingSubjects!.isNotEmpty) {
//   //       subjectsController.hasFailingSubjects = 1;
//   //     } else {
//   //       subjectsController.hasFailingSubjects = 0;
//   //     }
//   //     if (UserCache().data!.userInfo!.failingSubjects != null) {
//   //       subjectsController.selectedSubjects =
//   //           UserCache().data!.userInfo!.failingSubjects!;
//   //     }
//   //   }
//   // }

//   void fillData(List<TitleInterface> list) {
//     if (list.length == 1) {
//       selectedEducationLevelId = list.first.id;
//       educationLevelController.text = list.first.title;
//       educationStages = list.first.children as List<EducationInformation>;
//       if (educationStages.length == 1) {
//         selectedEducationStageId = educationStages.first.id;
//         educationStageController.text = educationStages.first.title;
//         educationYears =
//             educationStages.first.children as List<EducationInformation>;
//         if (educationYears.length == 1) {
//           selectedEducationYearId = educationYears.first.id;
//           educationYearController.text = educationYears.first.title;
//           subjects =
//               educationYears.first.children as List<EducationInformation>;
//         }
//       }
//     }
//   }

//   @override
//   void onInit() {
//     fetchData();
//     educationLevelController = TextEditingController();
//     educationStageController = TextEditingController();
//     educationYearController = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     // educationLevelController.dispose();
//     // educationStageController.dispose();
//     // educationYearController.dispose();
//     super.onClose();
//   }
// }
// //</editor-fold>
