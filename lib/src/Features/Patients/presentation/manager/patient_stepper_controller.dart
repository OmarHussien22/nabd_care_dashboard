import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PatientStepController extends GetControllerInterface {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(4, (_) => GlobalKey());
  int currentStep = 0;
  @override
  void onInit() {
    super.onInit();
    currentStep = 0;
  }

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

  List<(IconData, String, String?)> kSteps = [
    (
      Icons.person_outline_rounded,
      'patient_information',
      'medical_status_history'
    ),
    (
      Icons.medical_services_outlined,
      'medical_status_history',
      'media_attachments'
    ),
    (
      Icons.attach_file_rounded,
      'media_attachments',
      'administrative_details',
    ),
    (
      Icons.admin_panel_settings_outlined,
      'administrative_details',
      null,
    ),
  ];

  int get totalSteps => sectionKeys.length;
  //// this function to go to previous step
  void back() {
    if (currentStep > 0) {
      updateStep(currentStep - 1);
    }
    update();
  }

  void goToStep(int step) {
    updateStep(step);
    // Scroll to top of the page whenever step changes
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
    update();
  }

  void nextStep() {
    final next = currentStep + 1;
    if (next < totalSteps) {
      goToStep(next);
    } else {
      _submitForm();
    }
  }

  void _submitForm() {
    Get.find<MainLayoutController>().pushReplacementPage(AppRoutes.patients);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
