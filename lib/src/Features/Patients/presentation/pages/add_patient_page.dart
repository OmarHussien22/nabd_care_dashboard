import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patienr_medical_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_information_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_section_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScopeNode node = FocusScope.of(context);
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Add Patient'),
        // ),
        body: GetBuilder<AddPatientBuilder>(
            init: AddPatientBuilder(),
            builder: (cnt) {
              return Padding(
                padding: AppInsets.defaultScreenALL,
                child: AnimatedWrapper(
                  styles: WrapAnimationStyles.scale,
                  child: Form(
                    key: cnt.globalKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.ESH(),
                          AddPatientSectionCard(
                            icon: Icons.person,
                            title: 'patient_information'.toTr(),
                            children: [
                              // Patient Information Section
                              AddPatientInformationCard(node: node),
                            ],
                          ),
                          AddPatientSectionCard(
                            title: "medical_status_history".toTr(),
                            icon: Icons.medical_services_outlined,
                            children: [
                              // Patient Information Section
                              AddPatienrMedicalCard(node: node),
                            ],
                          ),
                          AddPatientSectionCard(
                            icon: Icons.person,
                            title: 'patient_information',
                            children: [
                              // Patient Information Section
                              AddPatientInformationCard(node: node),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
