import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/enums/book_status_enum.dart';
import 'package:care_desk/src/Features/Patients/enums/visit_type_enum.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientDetailsHeader extends StatelessWidget {
  final PatientEntity patient;

  const PatientDetailsHeader({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final dynamic patientData = patient;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.get.primary,
            AppColors.get.primary.withAlpha(217),
            AppColors.get.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -60,
            top: -30,
            child: _GlowCircle(color: Colors.white.withAlpha(20), size: 180),
          ),
          Positioned(
            left: -40,
            bottom: -50,
            child: _GlowCircle(color: Colors.white.withAlpha(13), size: 220),
          ),
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 24.toW(), vertical: 16.toH()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: isMobile ? 28 : 34,
                        backgroundColor: Colors.white.withAlpha(46),
                        child: Icon(
                          patient.gender == 1
                              ? Icons.person_rounded
                              : Icons.person_2_rounded,
                          size: isMobile ? 30 : 36,
                          color: AppColors.get.white,
                        ),
                      ),
                      SizedBox(width: 16.toW()),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              patient.title.isNotEmpty
                                  ? patient.title
                                  : 'Unnamed Patient',
                              fontSize: isMobile ? 20 : 24,
                              fontWeight: FW.bold,
                              color: AppColors.get.white,
                              isOverFlow: true,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            CustomText(
                              '#${patient.id} • ${_visitTypeLabel(patient.visitType)}',
                              color: AppColors.get.white.withAlpha(224),
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _HeaderChip(
                        icon: Icons.cake_outlined,
                        label: patient.age.isNotEmpty ? '${patient.age} yrs' : 'Age N/A',
                      ),
                      _HeaderChip(
                        icon: patient.gender == 1
                            ? Icons.male_rounded
                            : Icons.female_rounded,
                        label: _genderLabel(patient.gender),
                      ),
                      _HeaderChip(
                        icon: Icons.favorite_border_rounded,
                            label: (patientData.bloodType as String?)?.isNotEmpty == true
                                ? patientData.bloodType as String
                            : 'Blood type N/A',
                      ),
                      _HeaderChip(
                        icon: Icons.verified_user_outlined,
                        label: _statusLabel(patient.status),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _genderLabel(int gender) => gender == 1 ? 'Male' : 'Female';

  String _statusLabel(BookStatusEnum status) => status.label;

  String _visitTypeLabel(VisitTypeEnum type) => type.label;
}

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(36),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withAlpha(51)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

