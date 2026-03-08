import 'package:care_desk/src/Features/Patients/core/add_patinet_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/upload_attachments.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_stepper_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_card.dart';
import 'package:intl/intl.dart';

import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/general_static_entity.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientBuilder extends GetControllerInterface {
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
  late TextEditingController referralSourceController;
  late TextEditingController secretaryNotesController;
  late TextEditingController dateOfVisitController;
  late TextEditingController timeOfVisitController;
  late TextEditingController priceController;
  //Gender
  GenderEntity? selectGender;
  int selectGenderIndex = 0;

  //Date of Birth
  DateTime? selectDateOfBirth;

  //Visit Type
  VisitTypeEntity? selectVisitType;
  int selectVisitTypeIndex = 0;

  //Chronic Diseases
  List<int> selectedChronicDiseases = [];

  //Medications
  List<int> selectedMedications = [];

  //Attachments
  List<UploadAttachment> attachments = [];

  //Referral Type
  ReferralSourcesEntity? selectReferralSource;

  // functions slected

  void setSelectedGender(GenderEntity value) {
    selectGender = value;
    selectGenderIndex = GenderEntity.getGenderList.indexOf(value);
    printDM("selectGender ${selectGender?.title}");
    update();
  }

  void setSelectedDateOfBirth(DateTime value) {
    selectDateOfBirth = value;
    dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(value);
    update();
  }

  void setSelectedVisitType(VisitTypeEntity value) {
    selectVisitType = value;
    selectVisitTypeIndex = VisitTypeEntity.getVisitTypeList.indexOf(value);
    update();
  }

  void setSelectedChronicDiseases(DiseaseEntity value) {
    if (selectedChronicDiseases.contains(value.id)) {
      removeSelectedChronicDisease(value.id);
    } else {
      selectedChronicDiseases.add(value.id);
      printDM("selectedChronicDiseases $selectedChronicDiseases");
    }
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

    for (var file in files) {
      final attachment = UploadAttachment(
        getFile: GetFile(platformFile: file),
        name: file.name,
        size: Helper.mediaSizeHandler.formatBytes(file.size),
      );

      attachments.add(attachment);

      update();

      _uploadFile(attachment);
    }
  }

  Future<void> _uploadFile(UploadAttachment file) async {
    try {
      file.state = FileUploadState.uploading;
      updateAttachment(file);

      for (int i = 1; i <= 100; i++) {
        await Future.delayed(const Duration(milliseconds: 40));

        file.progress = i / 100;

        updateAttachment(file);
      }

      file.state = FileUploadState.completed;

      updateAttachment(file);
    } catch (e) {
      file.state = FileUploadState.failed;

      updateAttachment(file);
    }
  }

  void updateAttachment(UploadAttachment file) {
    update(['upload_${file.id}']);
  }

  void removeAttachment(UploadAttachment attachment) {
    attachments.remove(attachment);
    update();
  }

  void cancelUpload(UploadAttachment attachment) {
    attachment.cancelToken?.cancel();
    attachment.state = FileUploadState.failed;
    update();
  }

  void setReferralSource(ReferralSourcesEntity referralSource) {
    selectReferralSource = referralSource;
    referralSourceController.text = referralSource.name;
    update();
  }

  /// to send data to controller
  AddPatinetParams toMap() {
    return AddPatinetParams(
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      mainComplaint: mainComplaintController.text,
      allergies: allergiesController.text,
      notes: notesController.text,
      dateOfBirth: dateOfBirthController.text,
      referralSource: selectReferralSource?.id ?? -1,
      gender: selectGender?.id ?? -1,
      visitType: selectVisitType?.id ?? -1,
      chronicDiseases: selectedChronicDiseases,
      medications: selectedMedications,
      attachments: attachments,
    );
  }

  

  void clear() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    mainComplaintController.clear();
    allergiesController.clear();
    notesController.clear();
    dateOfBirthController.clear();
    referralSourceController.clear();
    secretaryNotesController.clear();
    dateOfVisitController.clear();
    timeOfVisitController.clear();
    priceController.clear();
    selectGender = GenderEntity.getGenderList.first;
    selectVisitType = VisitTypeEntity.getVisitTypeList.first;
    selectReferralSource = null;
    selectedChronicDiseases.clear();
    selectedMedications.clear();
    attachments.clear();
    update();
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
    referralSourceController = TextEditingController();

    selectGender = GenderEntity.getGenderList.first;
    selectVisitType = VisitTypeEntity.getVisitTypeList.first;
    secretaryNotesController = TextEditingController();
    dateOfVisitController = TextEditingController();
    timeOfVisitController = TextEditingController();
    priceController = TextEditingController();

    nameController.addListener(update);
    phoneController.addListener(update);
    addressController.addListener(update);
    mainComplaintController.addListener(update);
    dateOfBirthController.addListener(update);
    dateOfVisitController.addListener(update);
    timeOfVisitController.addListener(update);
    priceController.addListener(update);
    referralSourceController.addListener(update);
    secretaryNotesController.addListener(update);
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
    referralSourceController.dispose();
    secretaryNotesController.dispose();
    dateOfVisitController.dispose();
    timeOfVisitController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
