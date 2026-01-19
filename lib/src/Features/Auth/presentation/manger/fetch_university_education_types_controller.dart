// import 'package:care_desk/src/Core/Utils/Extensions/basic_op_extensions.dart';
// import 'package:care_desk/src/Features/Auth/presentation/manger/set_user_info_controller.dart';
// import 'package:care_desk/src/Features/Auth/presentation/manger/subjects_controller.dart';
// import 'package:care_desk/src/Shared/Caches/user_cache.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
// import '../../../Core/Utils/Validation/app_validator.dart';
// import '../../../Core/Utils/general_utils.dart';
// import '../../../Shared/Entities/title_interface.dart';
// import '../../../Super/Controllers/Resources/get/get_controller_interface.dart';
// import '../../core/params/set_user_info_params.dart';
// import '../../data/models/educational_information.dart';
// import '../../domain/use_cases/fetch_university_education_types_use_case.dart';

// //<editor-fold desc="Controller">
// class FetchUniversityEducationTypesController
//     extends GetControllerInterface<List<EducationInformation>> {
//   late TextEditingController educationLevelController;
//   late TextEditingController universityController;
//   late TextEditingController collegeController;
//   late TextEditingController departmentController;
//   late TextEditingController divisionController;

//   final bool isEdit;
//   FetchUniversityEducationTypesController({required this.isEdit});

//   int educationLevelId = -1;
//   int universityID = -1;
//   int collegeID = -1;
//   int departmentID = -1;
//   int divisionID = -1;

//   int educationLevelIndex = -1;
//   int universityIndex = -1;
//   int collegeIndex = -1;
//   int departmentIndex = -1;
//   int divisionIndex = -1;

//   List<EducationInformation> levels = [];
//   List<EducationInformation> universities = [];
//   List<EducationInformation> colleges = [];
//   List<EducationInformation> departments = [];
//   List<EducationInformation> divisions = [];
//   List<EducationInformation> subjects = [];

//   void fillData(List<TitleInterface> list) {
//     if (list.length == 1) {
//       educationLevelId = list.first.id;
//       educationLevelController.text = list.first.title;
//       universities = list.first.children as List<EducationInformation>;
//       if (universities.length == 1) {
//         universityID = universities.first.id;
//         universityController.text = universities.first.title;
//         colleges = universities.first.children as List<EducationInformation>;
//         if (colleges.length == 1) {
//           collegeID = colleges.first.id;
//           collegeController.text = colleges.first.title;
//           departments = colleges.first.children as List<EducationInformation>;
//         }
//         if (departments.length == 1) {
//           departmentID = departments.first.id;
//           departmentController.text = departments.first.title;
//           divisions = departments.first.children as List<EducationInformation>;
//         }
//         if (divisions.length == 1) {
//           divisionID = divisions.first.id;
//           divisionController.text = divisions.first.title;
//           subjects = divisions.first.children as List<EducationInformation>;
//         }
//       }
//     }
//   }

//   SubjectsController subjectsController = Get.put(SubjectsController());

//   final formKey = GlobalKey<FormState>();

//   void setEducationLevelID(EducationInformation value) {
//     educationLevelId = value.id;
//     educationLevelController.text = value.title;
//     educationLevelIndex =
//         levels.indexWhere((element) => element.id == value.id);
//     if (educationLevelIndex > -1) {
//       universities =
//           levels[educationLevelIndex].children as List<EducationInformation>;
//     }
//     universityID = -1;
//     collegeID = -1;
//     departmentID = -1;
//     divisionID = -1;
//     universityController.clear();
//     collegeController.clear();
//     departmentController.clear();
//     divisionController.clear();
//     update();
//   }

//   setUniversities(EducationInformation university) {
//     universityID = university.id;
//     universityController.text = university.title;
//     universityIndex = universities.indexWhere(
//       (element) => element.id == universityID,
//     );
//     if (universityIndex > -1) {
//       colleges =
//           universities[universityIndex].children as List<EducationInformation>;
//     }
//     collegeID = -1;
//     departmentID = -1;
//     divisionID = -1;
//     collegeController.clear();
//     departmentController.clear();
//     divisionController.clear();
//     update();
//   }

//   setColleges(EducationInformation college) {
//     collegeID = college.id;
//     collegeController.text = college.title;
//     collegeIndex = colleges.indexWhere(
//       (element) => element.id == collegeID,
//     );
//     if (collegeIndex > -1) {
//       departments =
//           colleges[collegeIndex].children as List<EducationInformation>;
//     }
//     departmentID = -1;
//     divisionID = -1;
//     departmentController.clear();
//     divisionController.clear();
//     update();
//   }

//   setDepartments(EducationInformation department) {
//     departmentID = department.id;
//     departmentController.text = department.title;
//     departmentIndex = departments.indexWhere(
//       (element) => element.id == departmentID,
//     );
//     if (departmentIndex > -1) {
//       divisions =
//           departments[departmentIndex].children as List<EducationInformation>;
//     }
//     divisionID = -1;
//     divisionController.clear();
//     update();
//   }

//   setDivisions(EducationInformation division) {
//     divisionID = division.id;
//     divisionController.text = division.title;
//     divisionIndex = divisions.indexWhere(
//       (element) => element.id == divisionID,
//     );
//     if (divisionIndex > -1) {
//       subjects =
//           divisions[divisionIndex].children as List<EducationInformation>;
//     }
//     update();
//   }

//   SetUserInfoController setUserInfoController =
//       Get.put(SetUserInfoController());

//   submitEducationInfo() async {
//     formValidator(
//       globalKey: formKey,
//       onSuccessValidate: () {
//         setUserInfoController.setUserInfo(
//           isEdit: isEdit,
//           setUserInfoParams: SetUserInfoParams(
//             categoryId: 2,
//             universityEducationTypeId: educationLevelId,
//             universityId: universityID,
//             collegeId: collegeID,
//             departmentId: departmentID,
//             divisionId: divisionID,
//             subjectIds:
//                 subjectsController.selectedSubjects.map((e) => e.id).toList(),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> fetchData() async {
//     emit(const DataLoading());
//     final state = await FetchUniversityEducationTypesUseCase().call()!;
//     if (state is DataSuccess) {
//       printDM("isEdit: $isEdit");
//       levels = state.data.notNull;
//       printDM("levels: $levels");
//       fillData(levels);
//       if (isEdit) {
//         prepareData();
//       }
//     } else {
//       ClientSnacks.requestError(error: state.error?.title);
//     }
//     emit(state);
//   }

//   prepareData() {
//     printDM("tahaa");
//     if (UserCache().data != null) {
//       printDM(
//           "levelllllll ${UserCache().data!.userInfo!.universityEducationTypeId}");
//       if (UserCache().data!.userInfo!.universityEducationTypeId != null) {
//         setEducationLevelID(
//           EducationInformation(
//             id: UserCache().data!.userInfo!.universityEducationTypeId!,
//             title: UserCache().data!.userInfo!.universityEducationTypeTitle!,
//           ),
//         );
//       }
//       if (UserCache().data!.userInfo!.universityId != null) {
//         setUniversities(
//           EducationInformation(
//             id: UserCache().data!.userInfo!.universityId!,
//             title: UserCache().data!.userInfo!.universityTitle!,
//           ),
//         );
//       }
//       if (UserCache().data!.userInfo!.collegeId != null) {
//         setColleges(
//           EducationInformation(
//             id: UserCache().data!.userInfo!.collegeId!,
//             title: UserCache().data!.userInfo!.collegeTitle!,
//           ),
//         );
//       }
//       if (UserCache().data!.userInfo!.departmentId != null) {
//         setDepartments(
//           EducationInformation(
//             id: UserCache().data!.userInfo!.departmentId!,
//             title: UserCache().data!.userInfo!.departmentTitle!,
//           ),
//         );
//       }
//       if (UserCache().data!.userInfo!.divisionId != null) {
//         setDivisions(
//           EducationInformation(
//             id: UserCache().data!.userInfo!.divisionId!,
//             title: UserCache().data!.userInfo!.divisionTitle!,
//           ),
//         );
//       }
//       if (UserCache().data!.userInfo!.failingSubjects!.isNotEmpty) {
//         subjectsController.hasFailingSubjects = 1;
//       } else {
//         subjectsController.hasFailingSubjects = 0;
//       }
//       if (UserCache().data!.userInfo!.failingSubjects != null) {
//         subjectsController.selectedSubjects =
//             UserCache().data!.userInfo!.failingSubjects!;
//       }
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchData();
//     educationLevelController = TextEditingController();
//     universityController = TextEditingController();
//     collegeController = TextEditingController();
//     departmentController = TextEditingController();
//     divisionController = TextEditingController();
//   }

//   @override
//   void onClose() {
//     // educationLevelController.dispose();
//     // universityController.dispose();
//     // collegeController.dispose();
//     // departmentController.dispose();
//     // divisionController.dispose();
//     super.onClose();
//   }
// }
// //</editor-fold>
