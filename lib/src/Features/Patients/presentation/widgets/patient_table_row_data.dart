import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientTableRowData {
  static List<TableRowData> patientRowsTable({
    required List<PatientEntity> patients,
    required Function() onTap,
  }) {
    return patients.map((patient) {
      final labelStatus = patient.status.label;
      final colorStatus = patient.status.color;
      final visitLabel = patient.visitType.label;
      final visitColor = patient.visitType.color;

      return TableRowData(
        id: patient.id.toString(),
        cells: [
          // Patient ID
          CustomText(
            '#${patient.id}',

            // fontWeight: FW.semiBold,
            color: AppColors.get.textSecondary,
            fontSize: 11,
          ),

          // Name with avatar
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.get.surfaceContainer,
                child: Icon(
                  patient.gender == 1 ? Icons.person : Icons.person_2,
                  size: 16,
                  color: AppColors.get.textSecondary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomText(
                  patient.title,
                  fontWeight: FW.medium,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          // Age
          CustomText(patient.age, fontSize: 12),

          // Booking date
          CustomText(patient.bookingDate, fontSize: 12),

          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colorStatus.withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomText(
              labelStatus,
              fontSize: 11,
              color: colorStatus,
              fontWeight: FW.semiBold,
            ),
          ),

          // Price
          CustomText(
            '\$${patient.price}',
            fontWeight: FW.bold,
            fontSize: 12,
          ),

          // Visit type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.get.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomText(
              visitLabel,
              fontSize: 11,
              color: visitColor,
              fontWeight: FW.medium,
            ),
          ),

          // Phone
          CustomText(patient.phone, fontSize: 12),

          // Attachments count
          // Row(
          //   children: [
          //     Icon(
          //       Icons.attach_file,
          //       size: 14,
          //       color: AppColors.get.textSecondary,
          //     ),
          //     const SizedBox(width: 4),
          //     CustomText(
          //       '${patient.attachments.length} Files',
          //       fontSize: 12,
          //       color: AppColors.get.textSecondary,
          //     ),
          //   ],
          // ),
        ],
        onTap: () {},
      );
    }).toList();
  }
}
