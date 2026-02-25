import 'dart:io';
import 'package:intl/intl.dart';

import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/gender_entity.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';

class AddPatientBuilder extends GetControllerInterface {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // Controllers for Personal Information
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  // Controllers for Medical Information
  late TextEditingController mainComplaintController;
  late TextEditingController allergiesController;

  // Controllers for Administrative Details
  late TextEditingController notesController;
  late TextEditingController dateOfBirthController;
  // List<String> genderList = ["male", "female"];
  GenderEntity? selectGender;
  int selectGenderIndex = 0;
  DateTime? selectDateOfBirth;
  int? selectVisitType;
  int? selectReferralType;

  List<int> selectedChronicDiseases = [];
  List<int> selectedMedications = [];

  List<File> attachments = [];

  // functions slected

  void setSelectedGender(GenderEntity value) {
    selectGender = value;
    // selectGenderIndex = genderList.indexOf(value);
    selectGenderIndex = GenderEntity.getGenderList.indexOf(value);
    printDM("selectGender ${selectGender?.name}");
    update();
  }

  void setSelectedDateOfBirth(DateTime value) {
    selectDateOfBirth = value;
    dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(value);
    update();
  }

  void setSelectedVisitType(int value) {
    selectVisitType = value;
    update();
  }

  void setSelectedReferralType(int value) {
    selectReferralType = value;
    update();
  }

  void setSelectedChronicDiseases(List<int> value) {
    selectedChronicDiseases = value;
    update();
  }

  void removeSelectedChronicDisease(int index) {
    selectedChronicDiseases.removeAt(index);
    update();
  }

  void setSelectedMedications(List<int> value) {
    selectedMedications = value;
    update();
  }

  void removeSelectedMedication(int index) {
    selectedMedications.removeAt(index);
    update();
  }

  void setAttachments(List<File> value) {
    attachments = value;
    update();
  }

  void pickDateOfBirth() async {
    // final DateTime? picked = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
    //   firstDate: DateTime(1900),
    //   lastDate: DateTime.now(),
    //   builder: (context, child) {
    //     return Theme(
    //       data: Theme.of(context).copyWith(
    //         colorScheme: ColorScheme.light(
    //           primary: AppColors.get.primary,
    //         ),
    //       ),
    //       child: child!,
    //     );
    //   },
    // );
    // if (picked != null) {
    //
    //     _selectedDateOfBirth = picked;
    //   update();
    // }
  }

  int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void handelUploadAttachments() async {
    final files = await Helper.media.pickFilesDirectly(
      allowMultiple: true,
    );

    if (files.isNotEmpty) {
      attachments.addAll(files);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    mainComplaintController = TextEditingController();
    allergiesController = TextEditingController();
    notesController = TextEditingController();
    dateOfBirthController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    mainComplaintController.dispose();
    allergiesController.dispose();
    notesController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
}
