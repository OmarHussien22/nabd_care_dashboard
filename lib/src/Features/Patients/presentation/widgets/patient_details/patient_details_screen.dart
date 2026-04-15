import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_details_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/contact_info_tile.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/medical_history_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_details_error_view.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_details_header.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_details_loading_view.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_info_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_section_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Shared/Presentation/Widgets/DataBuilder/imports_data_builder.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientDetailsController>(
      builder: (controller) {
        return DataStatusBuilder(
          status: controller.state,

          onLoadingBuild: const PatientDetailsLoadingView(),
          onErrorBuild: PatientDetailsErrorView(onRetry: controller.retry),
          onDoneBuild: _PatientDetailsBody(patient: controller.patient),
          isImportant: true,
        );
      },
    );
  }
}

class _PatientDetailsBody extends StatelessWidget {
  final PatientEntity patient;

  const _PatientDetailsBody({required this.patient});

  @override
  Widget build(BuildContext context) {
    final sidePadding = 24.toW();

    return Directionality(
      textDirection:
          Get.locale?.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.get.background,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 230,
              elevation: 0,
              backgroundColor: AppColors.get.primary,
              foregroundColor: AppColors.get.white,
              title: Text('patient_details'.toTr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white,)),
              flexibleSpace: FlexibleSpaceBar(
                background: PatientDetailsHeader(patient: patient),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(sidePadding, 20.toH(), sidePadding, 28),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    PatientInfoCard(patient: patient),
                    SizedBox(height: 18.toH()),
                    PatientSectionCard(
                      title: 'contact_information'.toTr(),
                      icon: Icons.contact_phone_outlined,
                      child: Column(
                        children: [
                          ContactInfoTile(
                            icon: Icons.phone_rounded,
                            label: 'phone_number'.toTr(),
                            value: patient.phone.isNotEmpty ? patient.phone : '-',
                          ),
                          const SizedBox(height: 12),
                          ContactInfoTile(
                            icon: Icons.location_on_outlined,
                            label: 'address'.toTr(),
                            value: patient.address.isNotEmpty ? patient.address : '-',
                          ),
                          const SizedBox(height: 12),
                          ContactInfoTile(
                            icon: Icons.cake_outlined,
                            label: 'date_of_birth'.toTr(),
                            value:
                                patient.dateOfBirth.isNotEmpty ? patient.dateOfBirth : '-',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.toH()),
                    MedicalHistoryCard(patient: patient),
                    SizedBox(height: 18.toH()),
                    PatientSectionCard(
                      title: 'administrative_details'.toTr(),
                      icon: Icons.receipt_long_outlined,
                      child: Column(
                        children: [
                          ContactInfoTile(
                            icon: Icons.badge_outlined,
                            label: 'referral_source'.toTr(),
                            value: _referralSourceName(patient.referralSource),
                          ),
                          const SizedBox(height: 12),
                          ContactInfoTile(
                            icon: Icons.date_range_outlined,
                            label: 'booking_date'.toTr(),
                            value: patient.bookingDate.isNotEmpty
                                ? patient.bookingDate
                                : '-',
                          ),
                          const SizedBox(height: 12),
                          ContactInfoTile(
                            icon: Icons.access_time_rounded,
                            label: 'booking_time'.toTr(),
                            value: patient.bookingTime.isNotEmpty
                                ? patient.bookingTime
                                : '-',
                          ),
                          const SizedBox(height: 12),
                          ContactInfoTile(
                            icon: Icons.payments_outlined,
                            label: 'price'.toTr(),
                            value: patient.price.isNotEmpty ? patient.price : '-',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _referralSourceName(int referralSourceId) {
    if (referralSourceId <= 0) return '-';
    final matches = ReferralSourcesEntity.referralSources
        .where((element) => element.id == referralSourceId)
        .toList();
    return matches.isNotEmpty ? matches.first.title : referralSourceId.toString();
  }
}

