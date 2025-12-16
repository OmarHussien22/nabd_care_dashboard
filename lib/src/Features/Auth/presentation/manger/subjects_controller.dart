// import 'package:care_desk/src/Core/Utils/Extensions/basic_op_extensions.dart';
// import 'package:care_desk/src/Features/Auth/data/models/educational_information.dart';
// import 'package:flutter/foundation.dart';

// import '../../../Shared/Presentation/Widgets/GeneralWidgets/Sheets/app_Sheet.dart';
// import '../../../Super/Controllers/Resources/get/get_controller_interface.dart';

// class SubjectsController extends GetControllerInterface {
//   int _hasFailingSubjects = -1;
//   int get hasFailingSubjects => _hasFailingSubjects;
//   set hasFailingSubjects(int value) {
//     _hasFailingSubjects = value;
//     update();
//   }

//   List<EducationInformation> _selectedSubjects = [];
//   List<EducationInformation> get selectedSubjects => _selectedSubjects;
//   set selectedSubjects(List<EducationInformation> value) {
//     _selectedSubjects = value;
//     update();
//   }

//   void _setSelectedSubjectIDs(List<EducationInformation> value) {
//     if (value.isNotEmpty) {
//       _selectedSubjects = value;
//       update();
//     }
//   }

//   void removeSubject(int id) {
//     if (_selectedSubjects.isEmpty) return;
//     _selectedSubjects.removeWhere((element) => element.id == id);
//     _hasFailingSubjects = _selectedSubjects.isEmpty ? 0 : 1;
//     update();
//   }

//   void setHasFailingSubjects(bool value, {VoidCallback? onSelect}) {
//     _hasFailingSubjects = value.toInt;
//     update();
//     if (value) {
//       onSelect?.call();
//     }
//   }

//   void openSubjectsSelectionSheet(
//       {required List<EducationInformation> subjects}) {
//     AppSheets.get.showMultiSelection<EducationInformation>(
//       title: 'select_subject',
//       items: subjects,
//       selectedIds: _selectedSubjects.map((e) => e.id).toList(),
//       onSave: _setSelectedSubjectIDs,
//     );
//     update();
//   }
// }
