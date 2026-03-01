import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patienr_medical_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_admin_details.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_attachment_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_buttons.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_header.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_information_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AddPatientBuilder>().scrollController.addListener(_onScroll);
    });
  }

  int _lastStep = 0;

  void _onScroll() {
    if (!mounted) return;
    final builder = Get.find<AddPatientBuilder>();
    final keys = builder.sectionKeys;
    int newStep = 0;

    // Only recalculate if we've scrolled enough to potentially change sections
    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject();
        if (box is RenderBox) {
          final position = box.localToGlobal(Offset.zero).dy;
          // Threshold for "active" section
          if (position < 300.toH()) {
            newStep = i;
          }
        }
      }
    }

    if (newStep != _lastStep) {
      _lastStep = newStep;
      builder.updateStep(newStep);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode node = FocusScope.of(context);
    final cnt = Get.put(AddPatientBuilder());

    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: Column(
        children: [
          // ─── Header (Targeted Rebuild) ───────────────
          GetBuilder<AddPatientBuilder>(
            id: AddPatientBuilder.updateHeaderId,
            builder: (cnt) => AddPatientHeader(currentStep: cnt.currentStep),
          ),

          // ─── Scrollable Content ───────────────
          Expanded(
            child: Form(
              key: cnt.globalKey,
              child: SingleChildScrollView(
                controller: cnt.scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: AppInsets.defaultScreenALL.left,
                  right: AppInsets.defaultScreenALL.right,
                  top: 8.toH(),
                  bottom: 24.toH(),
                ),
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 450),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 40,
                        child: FadeInAnimation(child: widget),
                      ),
                      children: [
                        // ── Patient Info ──
                        GetBuilder<AddPatientBuilder>(
                          id: AddPatientBuilder.sectionUpdateId(0),
                          builder: (cnt) => AddPatientSectionCard(
                            key: cnt.sectionKeys[0],
                            icon: Icons.person_outline_rounded,
                            title: 'patient_information'.toTr(),
                            isActive: cnt.currentStep == 0,
                            children: [AddPatientInformationCard(node: node)],
                          ),
                        ),

                        // ── Medical Info ──
                        GetBuilder<AddPatientBuilder>(
                          id: AddPatientBuilder.sectionUpdateId(1),
                          builder: (cnt) => AddPatientSectionCard(
                            key: cnt.sectionKeys[1],
                            icon: Icons.medical_services_outlined,
                            title: "medical_status_history".toTr(),
                            isActive: cnt.currentStep == 1,
                            children: [AddPatienrMedicalCard(node: node)],
                          ),
                        ),

                        // ── Media ──
                        GetBuilder<AddPatientBuilder>(
                          id: AddPatientBuilder.sectionUpdateId(2),
                          builder: (cnt) => AddPatientSectionCard(
                            key: cnt.sectionKeys[2],
                            icon: Icons.attach_file_rounded,
                            title: 'media_attachments'.toTr(),
                            isActive: cnt.currentStep == 2,
                            children: [AddPatientAttachmentCard(node: node)],
                          ),
                        ),

                        // ── Admin ──
                        GetBuilder<AddPatientBuilder>(
                          id: AddPatientBuilder.sectionUpdateId(3),
                          builder: (cnt) => AddPatientSectionCard(
                            key: cnt.sectionKeys[3],
                            icon: Icons.admin_panel_settings_outlined,
                            title: "administrative_details".toTr(),
                            isActive: cnt.currentStep == 3,
                            children: [AddPatientAdminDetails(node: node)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          30.ESH(),
          // ─── Footer ───────────────
          AddPatientButtons(cnt: cnt),
        ],
      ),
    );
  }
}
