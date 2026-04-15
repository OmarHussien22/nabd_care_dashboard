import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_section_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class MedicalHistoryCard extends StatelessWidget {
  final PatientEntity patient;

  const MedicalHistoryCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return PatientSectionCard(
      title: 'medical_history',
      icon: Icons.favorite_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BlockTitle(icon: Icons.coronavirus_outlined, title: 'chronic_diseases'),
          const SizedBox(height: 10),
          _buildChips(
            patient.chronicDiseases.isNotEmpty
                ? patient.chronicDiseases.map((e) => e.name).toList()
                : const ['No chronic diseases recorded'],
          ),
          const SizedBox(height: 18),
          _BlockTitle(icon: Icons.medication_outlined, title: 'medications'),
          const SizedBox(height: 10),
          _buildChips(
            patient.medications.isNotEmpty
                ? patient.medications.map((e) => e.name).toList()
                : const ['No medications recorded'],
          ),
          const SizedBox(height: 18),
          _BlockTitle(icon: Icons.medical_services_outlined, title: 'allergies'),
          const SizedBox(height: 8),
          CustomText(
            patient.allergies.isNotEmpty ? patient.allergies : '-',
            fontSize: 14,
            fontWeight: FW.medium,
          ),
          const SizedBox(height: 18),
          _BlockTitle(icon: Icons.chat_bubble_outline_rounded, title: 'main_complaint'),
          const SizedBox(height: 8),
          CustomText(
            patient.mainComplaint.isNotEmpty ? patient.mainComplaint : '-',
            fontSize: 14,
            fontWeight: FW.medium,
          ),
          const SizedBox(height: 18),
          _BlockTitle(icon: Icons.sticky_note_2_outlined, title: 'notes'),
          const SizedBox(height: 8),
          CustomText(
            patient.notes.isNotEmpty ? patient.notes : '-',
            fontSize: 14,
            fontWeight: FW.medium,
          ),
          const SizedBox(height: 18),
          _BlockTitle(icon: Icons.attach_file_rounded, title: 'attachments'),
          const SizedBox(height: 8),
          CustomText(
            patient.attachments.isNotEmpty
                ? '${patient.attachments.length} attachment(s) available'
                : 'No attachments available',
            fontSize: 14,
            fontWeight: FW.medium,
          ),
        ],
      ),
    );
  }

  Widget _buildChips(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .map(
            (item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.get.primary.withAlpha(20),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: AppColors.get.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _BlockTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _BlockTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.get.primary),
        const SizedBox(width: 8),
        CustomText(
          title,
          fontSize: 14,
          fontWeight: FW.bold,
        ),
      ],
    );
  }
}

