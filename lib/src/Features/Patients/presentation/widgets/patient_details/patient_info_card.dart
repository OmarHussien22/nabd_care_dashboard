import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/enums/book_status_enum.dart';
import 'package:care_desk/src/Features/Patients/enums/visit_type_enum.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_section_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientInfoCard extends StatelessWidget {
  final PatientEntity patient;

  const PatientInfoCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return PatientSectionCard(
      title: 'patient_overview',
      icon: Icons.person_search_outlined,
      child: Wrap(
        spacing: 14,
        runSpacing: 14,
        children: [
          _InfoPill(
            icon: Icons.person_outline_rounded,
            title: 'full_name',
            value: patient.title.isNotEmpty ? patient.title : '-',
          ),
          _InfoPill(
            icon: Icons.cake_outlined,
            title: 'age',
            value: patient.age.isNotEmpty ? patient.age : '-',
          ),
          _InfoPill(
            icon: patient.gender == 1 ? Icons.male_rounded : Icons.female_rounded,
            title: 'gender',
            value: _genderLabel(patient.gender),
          ),
          _InfoPill(
            icon: Icons.favorite_border_rounded,
            title: 'blood_type',
            value: patient.bloodType.isNotEmpty ? patient.bloodType : '-',
          ),
          _InfoPill(
            icon: Icons.calendar_month_outlined,
            title: 'visit_type',
            value: _visitTypeLabel(patient.visitType),
          ),
          _InfoPill(
            icon: Icons.verified_outlined,
            title: 'status',
            value: _statusLabel(patient.status),
          ),
          _InfoPill(
            icon: Icons.badge_outlined,
            title: 'referral_source',
            value: _referralSourceName(patient.referralSource),
          ),
          _InfoPill(
            icon: Icons.payments_outlined,
            title: 'price',
            value: patient.price.isNotEmpty ? patient.price : '-',
          ),
        ],
      ),
    );
  }

  String _genderLabel(int gender) => gender == 1 ? 'Male' : 'Female';

  String _visitTypeLabel(VisitTypeEnum type) => type.label;

  String _statusLabel(BookStatusEnum status) => status.label;

  String _referralSourceName(int referralSourceId) {
    if (referralSourceId <= 0) return '-';
    final matches = ReferralSourcesEntity.referralSources
        .where((element) => element.id == referralSourceId)
        .toList();
    return matches.isNotEmpty ? matches.first.title : referralSourceId.toString();
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoPill({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 700 ? double.infinity : 250.toW(),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.get.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.get.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.get.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: AppColors.get.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title,
                  fontSize: 12,
                  fontWeight: FW.semiBold,
                  color: AppColors.get.textSecondary,
                ),
                const SizedBox(height: 4),
                CustomText(
                  value,
                  fontSize: 14,
                  fontWeight: FW.bold,
                  isOverFlow: true,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

