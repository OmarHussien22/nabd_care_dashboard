import 'package:care_desk/src/Features/Patients/core/add_patinet_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/upload_attachments.dart';
import 'package:dio/dio.dart';
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
  late TextEditingController dateOfBirthController;
  // late TextEditingController dateOfVisitController;

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
  // Date of visit
  DateTime? selecDateOfVisit;

  DateTime? selectTimeOfVisit;

  int age = 0;

  //Visit Type
  VisitTypeEntity? selectVisitType;
  int selectVisitTypeIndex = 0;

  //Chronic Diseases
  List<DiseaseEntity> selectedChronicDiseases = [];
  List<int> selectedChronicDiseasesIds = [];

  //Medications
  List<int> selectedMedications = [];

  //Attachments
  List<UploadAttachment> attachments = [];

  //Referral Type
  ReferralSourcesEntity? selectReferralSource;
  int? selectReferralSourceId;

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
    calculateAge(value);
    update();
  }

  void setSelectedDateOfVisit(DateTime value) {
    selecDateOfVisit = value;
    dateOfVisitController.text = DateFormat('yyyy-MM-dd').format(value);
    update();
  }

  void setSelectedTimeOfVisit(DateTime value) {
    selectTimeOfVisit = value;
    timeOfVisitController.text = DateFormat('h:mm a').format(value);
    update();
  }

  void setSelectedVisitType(VisitTypeEntity value) {
    selectVisitType = value;
    selectVisitTypeIndex = VisitTypeEntity.getVisitTypeList.indexOf(value);
    update();
  }

  void setSelectedChronicDiseases(DiseaseEntity value) {
    if (selectedChronicDiseasesIds.contains(value.id)) {
      removeSelectedChronicDisease(
          selectedChronicDiseasesIds.indexOf(value.id));
    } else {
      selectedChronicDiseases.add(value);
      selectedChronicDiseasesIds.add(value.id);
    }
    update();
  }

  void removeSelectedChronicDisease(int index) {
    selectedChronicDiseasesIds.removeAt(index);
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

  calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    age = now.year - birthDate.year;

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
      file.cancelToken = CancelToken();
      updateAttachment(file);

      for (int i = 1; i <= 100; i++) {
        // Check if the upload was canceled
        if (file.state == FileUploadState.failed) {
          printDM("Upload canceled for file: ${file.name}");
          return;
        }

        await Future.delayed(const Duration(milliseconds: 40));

        // Double check after delay in case it was canceled during the wait
        if (file.state == FileUploadState.failed) return;

        file.progress = i / 100;
        updateAttachment(file);
      }

      file.state = FileUploadState.completed;
      updateAttachment(file);
    } catch (e) {
      // If it's already failed (via cancelUpload), don't overwrite it
      if (file.state != FileUploadState.failed) {
        file.state = FileUploadState.failed;
        updateAttachment(file);
      }
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
    updateAttachment(attachment);
  }

  void setReferralSource(ReferralSourcesEntity referralSource) {
    selectReferralSource = referralSource;
    selectReferralSourceId = referralSource.id;

    printDM(
        "setReferralSource: id=${referralSource.id}, name=${referralSource.title}");
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
      notes: secretaryNotesController.text,
      dateOfBirth: dateOfBirthController.text,
      referralSource: selectReferralSource?.id ?? -1,
      gender: selectGender?.id ?? -1,
      visitType: selectVisitType?.id ?? -1,
      chronicDiseases: selectedChronicDiseasesIds,
      medications: selectedMedications,
      attachments: attachments,
      age: age.toString(),
      dateOfVisit: dateOfVisitController.text,
      timeOfVisit: timeOfVisitController.text,
      price: priceController.text,
    );
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    mainComplaintController.clear();
    allergiesController.clear();
    // notesController.clear();
    dateOfBirthController.clear();
    dateOfVisitController.clear();
    timeOfVisitController.clear();

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

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   phoneController.dispose();
  //   addressController.dispose();
  //   mainComplaintController.dispose();
  //   allergiesController.dispose();
  //   dateOfBirthController.dispose();
  //   dateOfVisitController.dispose();
  //   timeOfVisitController.dispose();
  //   referralSourceController.dispose();
  //   secretaryNotesController.dispose();
  //   priceController.dispose();
  //   super.onClose();
  // }
}
