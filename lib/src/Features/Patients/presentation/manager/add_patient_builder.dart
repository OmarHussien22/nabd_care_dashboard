import 'dart:io';
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/upload_attachments.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/file_upload_card.dart';
import 'package:intl/intl.dart';

import 'package:care_desk/src/Core/Services/helper.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/general_static_entity.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';

class AddPatientBuilder extends GetControllerInterface {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(4, (_) => GlobalKey());
  int currentStep = 0;

  static const String updateHeaderId = 'add_patient_header';
  static String sectionUpdateId(int index) => 'add_patient_section_$index';

  void updateStep(int step) {
    if (currentStep != step) {
      int oldStep = currentStep;
      currentStep = step;
      // Only update the header and the two cards that changed state
      update([
        updateHeaderId,
        sectionUpdateId(oldStep),
        sectionUpdateId(currentStep),
      ]);
    }
  }

  void back() {
    if (currentStep > 0) {
      scrollToStep(currentStep - 1);
    }
  }

  void scrollToStep(int step) {
    if (step >= 0 && step < sectionKeys.length) {
      final context = sectionKeys[step].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
        // Step will be updated by the scroll listener in the page
      } else {
        // Fallback if context is not ready
        updateStep(step);
      }
    }
  }

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
        getFile: GetFile(platformFile: file), // PlatformFile
        name: file.name, // بدل path.split
        size: Helper.mediaSizeHandler.formatBytes(file.size),
      );

      attachments.add(attachment);
      update();

      _uploadFile(attachment);
    }
  }

  Future<void> _uploadFile(UploadAttachment attachmentFiles) async {
    try {
      attachmentFiles.state = FileUploadState.uploading;
      update();

      // Simulate upload
      await Future.delayed(Duration(seconds: 2));

      attachmentFiles.state = FileUploadState.completed;
      attachmentFiles.progress = 100;
      attachmentFiles = attachments.firstWhere((e) =>
          e.getFile.platformFile == attachmentFiles.getFile.platformFile);
      update();
      // printDM("attachmentFiles ${attachmentFiles.getFile.platformFile}");
    } catch (e) {
      attachmentFiles.state = FileUploadState.failed;
      update();
    }
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
    printDM("selectReferralSource ${selectReferralSource?.name}");
    update();
  }

  Map<String, dynamic> toMap() {
    return {
      "name": nameController.text,
      "phone": phoneController.text,
      "address": addressController.text,
      "main_complaint": mainComplaintController.text,
      "allergies": allergiesController.text,
      "notes": notesController.text,
      "date_of_birth": dateOfBirthController.text,
      "referral_source": selectReferralSource?.id,
      "gender": selectGender?.id,
      "visit_type": selectVisitType?.id,
      "chronic_diseases": selectedChronicDiseases,
      "medications": selectedMedications,
      "attachments": attachments,
    };
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
    // Initialize with defaults so widgets never receive null groupValue
    selectGender = GenderEntity.getGenderList.first;
    selectVisitType = VisitTypeEntity.getVisitTypeList.first;
    secretaryNotesController = TextEditingController();
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
    scrollController.dispose();
    super.onClose();
  }
}
