import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patients_controller.dart';
import 'package:care_desk/src/Features/Patients/domain/entities/patient_entity.dart';

class PatientDetailsPage extends StatefulWidget {
  final int patientId;
  const PatientDetailsPage({super.key, required this.patientId});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  final PatientsController controller = Get.find<PatientsController>();
  late PatientEntity patient;

  @override
  void initState() {
    super.initState();
    // Locate patient by ID or fallback
    patient = controller.patients.firstWhere(
      (p) => p.id == widget.patientId,
      orElse: () => controller.patients.isNotEmpty 
          ? controller.patients.first 
          : PatientEntity.dummyPatients.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: 'Patient Medical Record',
      breadcrumb: AppBreadcrumb(
        items: [
          const BreadcrumbItem(label: 'Patients', route: '/patients'),
          BreadcrumbItem(label: patient.name),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () => context.go('/patients'),
          icon: const Icon(Icons.arrow_back_rounded, size: 18),
          label: const CustomText('Back to List', fontWeight: FW.bold),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 14.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toRad())),
            side: BorderSide(color: AppColors.get.border),
          ),
        ),
        12.ESW(),
        ElevatedButton.icon(
          onPressed: () => context.go('/patients/edit/${patient.id}'),
          icon: const Icon(Icons.edit_outlined, size: 18),
          label: const CustomText('Edit Profile', fontWeight: FW.bold, color: Colors.white),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 14.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: Column(
        children: [
          _buildPatientHeaderCard(),
          24.ESH(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Personal info & Emergency Contact
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildPersonalInfoCard(),
                    24.ESH(),
                    _buildEmergencyContactCard(),
                  ],
                ),
              ),
              24.ESW(),
              // Right Column: Medical Log, Diseases, Medications, Scans, Visits
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    _buildMedicalDetailsCard(),
                    24.ESH(),
                    _buildAttachmentsCard(),
                    24.ESH(),
                    _buildVisitsHistoryCard(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────── TOP HEADER CARD ───────────────────
  Widget _buildPatientHeaderCard() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 42.toRad(),
            backgroundColor: AppColors.get.primary.withOpacity(0.12),
            child: CustomText(
              patient.initials,
              fontSize: 24,
              fontWeight: FW.bold,
              color: AppColors.get.primary,
            ),
          ),
          24.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(patient.name, fontSize: 20, fontWeight: FW.bold, color: AppColors.get.textPrimary),
                    16.ESW(),
                    _buildStatusBadge(patient.isActive),
                  ],
                ),
                8.ESH(),
                Row(
                  children: [
                    _buildHeaderMetaItem(Icons.wc_rounded, patient.gender ?? 'Unknown'),
                    24.ESW(),
                    _buildHeaderMetaItem(Icons.cake_outlined, '${patient.age ?? '?'} years old'),
                    24.ESW(),
                    _buildHeaderMetaItem(Icons.bloodtype_rounded, 'Blood Type: ${patient.bloodType ?? 'N/A'}', color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.get.surfaceContainer.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
            ),
            child: Column(
              children: [
                CustomText('LAST VISIT', fontSize: 10.5, fontWeight: FW.bold, color: AppColors.get.textSecondary),
                6.ESH(),
                CustomText(patient.lastVisit ?? 'Never Visited', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderMetaItem(IconData icon, String label, {Color? color}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? AppColors.get.textSecondary),
        8.ESW(),
        CustomText(label, fontSize: 12.5, fontWeight: FW.medium, color: color != null ? color.withOpacity(0.8) : AppColors.get.textSecondary),
      ],
    );
  }

  Widget _buildStatusBadge(bool active) {
    final color = active ? AppColors.get.success : AppColors.get.red;
    final label = active ? 'Active Chart' : 'Inactive';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          8.ESW(),
          CustomText(label, fontSize: 11.5, color: color, fontWeight: FW.bold),
        ],
      ),
    );
  }

  // ─────────────────── PERSONAL INFORMATION CARD ───────────────────
  Widget _buildPersonalInfoCard() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader('Personal Information', Icons.badge_outlined, Colors.teal),
          20.ESH(),
          _buildDetailRow('Full Name', patient.name),
          _buildDetailRow('Gender', patient.gender ?? 'Not set'),
          _buildDetailRow('Date of Birth', patient.dateOfBirth ?? 'Not set'),
          _buildDetailRow('Phone Number', patient.phone ?? 'Not set'),
          _buildDetailRow('Email Address', patient.email ?? 'Not set'),
          _buildDetailRow('Home Address', patient.address ?? 'Not set'),
        ],
      ),
    );
  }

  // ─────────────────── EMERGENCY CONTACT CARD ───────────────────
  Widget _buildEmergencyContactCard() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader('Emergency Contact Details', Icons.contact_emergency_outlined, Colors.orange),
          20.ESH(),
          _buildDetailRow('Contact Name', patient.emergencyContact ?? 'Not specified'),
          _buildDetailRow('Phone Number', patient.emergencyPhone ?? 'Not specified'),
          _buildDetailRow('Relationship', 'Family Representative'),
        ],
      ),
    );
  }

  // ─────────────────── MEDICAL DETAILS, DISEASES, MEDICATIONS ───────────────────
  Widget _buildMedicalDetailsCard() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader('Medical Summary', Icons.monitor_heart_outlined, Colors.red.shade400),
          20.ESH(),

          // Chronic diseases list
          CustomText('Chronic Conditions', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          12.ESH(),
          if (patient.chronicDiseases == null || patient.chronicDiseases!.isEmpty)
            _buildNoDataBox('No chronic diseases recorded on this chart.')
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: patient.chronicDiseases!.map((d) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.teal.shade100),
                ),
                child: CustomText(d, fontSize: 12, color: Colors.teal.shade800, fontWeight: FW.bold),
              )).toList(),
            ),

          24.ESH(),
          const Divider(),
          24.ESH(),

          // Medications
          CustomText('Current Active Medications', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          12.ESH(),
          if (patient.medications == null || patient.medications!.isEmpty)
            _buildNoDataBox('No active medications registered.')
          else
            Column(
              children: patient.medications!.map((m) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.get.surfaceContainer.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.red.shade50, shape: BoxShape.circle),
                      child: Icon(Icons.medication_liquid_rounded, color: Colors.red.shade600, size: 18),
                    ),
                    16.ESW(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(m['name'] ?? '', fontSize: 13, fontWeight: FW.bold),
                          4.ESH(),
                          CustomText('Notes: ${m['notes'] ?? 'None'}', fontSize: 11.5, color: AppColors.get.textSecondary),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.red.shade100.withOpacity(0.6), borderRadius: BorderRadius.circular(6)),
                      child: CustomText(m['dosage'] ?? '', fontSize: 12, fontWeight: FW.bold, color: Colors.red.shade700),
                    ),
                  ],
                ),
              )).toList(),
            ),

          if (patient.medicalNotes != null && patient.medicalNotes!.isNotEmpty) ...[
            24.ESH(),
            const Divider(),
            24.ESH(),
            CustomText('General Medical Logs', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
            12.ESH(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: CustomText(patient.medicalNotes!, fontSize: 12.5, color: AppColors.get.textPrimary, maxLines: 5),
            ),
          ],
        ],
      ),
    );
  }

  // ─────────────────── TASK 12 & 13: ATTACHMENTS & PREMIUM VIEWER ───────────────────
  Widget _buildAttachmentsCard() {
    final docs = patient.attachments ?? [];

    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader('Medical Scans & Attachments', Icons.attach_file_rounded, Colors.blue),
          20.ESH(),
          if (docs.isEmpty)
            _buildNoDataBox('No laboratory test scans, PDFs, or invoices attached.')
          else ...[
            CustomText('Files Grid:', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
            12.ESH(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.toH(),
                crossAxisSpacing: 12.toW(),
                childAspectRatio: 2.2,
              ),
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final file = docs[index];
                final name = file['name'] ?? 'File';
                final type = file['type'] ?? 'IMAGE';
                final path = file['path'] ?? '';

                IconData icon;
                Color themeColor;

                if (type == 'PDF') {
                  icon = Icons.picture_as_pdf_rounded;
                  themeColor = Colors.red.shade600;
                } else if (type == 'EXCEL') {
                  icon = Icons.table_view_rounded;
                  themeColor = Colors.green.shade600;
                } else {
                  icon = Icons.image_rounded;
                  themeColor = Colors.blue.shade600;
                }

                return InkWell(
                  onTap: () => _handleAttachmentTap(file),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themeColor.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: themeColor.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: themeColor.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                          child: Icon(icon, color: themeColor, size: 22),
                        ),
                        12.ESW(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(name, fontSize: 12.5, fontWeight: FW.bold, isOverFlow: true, maxLines: 1),
                              4.ESH(),
                              CustomText(type, fontSize: 10.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
                            ],
                          ),
                        ),
                        Icon(Icons.open_in_new_rounded, size: 16, color: themeColor),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  // ─────────────────── TASK 13: ATTACHMENT VIEWER TRIGGER ───────────────────
  void _handleAttachmentTap(Map<String, String> file) {
    final type = file['type'] ?? 'IMAGE';
    final name = file['name'] ?? '';

    if (type == 'IMAGE') {
      _showPremiumPhotoViewer(name);
    } else if (type == 'PDF') {
      _showDocumentViewerDialog(name, 'PDF Document Viewer', Colors.red.shade600);
    } else if (type == 'EXCEL') {
      _showDocumentViewerDialog(name, 'Excel Spreadsheet Action', Colors.green.shade600);
    }
  }

  void _showPremiumPhotoViewer(String fileName) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(24),
        child: Container(
          width: 800,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Premium Titlebar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                color: Colors.grey.shade900,
                child: Row(
                  children: [
                    const Icon(Icons.image_rounded, color: Colors.blue),
                    12.ESW(),
                    Expanded(
                      child: CustomText(
                        'Viewer: $fileName',
                        fontSize: 14,
                        fontWeight: FW.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.zoom_in, color: Colors.white),
                      onPressed: () {}, // Zoom hint
                    ),
                    IconButton(
                      icon: const Icon(Icons.download_rounded, color: Colors.white),
                      onPressed: () {
                        Get.snackbar('Download Completed', 'Successfully saved $fileName locally.');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ),
              // Photo view area
              Expanded(
                child: ClipRect(
                  child: PhotoView(
                    imageProvider: const AssetImage('assets/images/chest_xray.png'), // Seeding standard mock asset
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.broken_image_rounded, size: 64, color: Colors.grey.shade700),
                            12.ESH(),
                            CustomText(
                              'Visual scan simulation active.',
                              fontSize: 13,
                              color: Colors.grey.shade400,
                              fontWeight: FW.medium,
                            ),
                            6.ESH(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.12), borderRadius: BorderRadius.circular(6)),
                              child: const CustomText('Clicking "Download" simulates files fetching.', fontSize: 11, color: Colors.blue),
                            ),
                          ],
                        ),
                      );
                    },
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    backgroundDecoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDocumentViewerDialog(String name, String viewerTitle, Color titleColor) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(viewerTitle.contains('PDF') ? Icons.picture_as_pdf_rounded : Icons.table_view_rounded, color: titleColor),
            12.ESW(),
            CustomText(viewerTitle, fontSize: 14, fontWeight: FW.bold),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText('Document Name:', fontSize: 11, color: AppColors.get.textSecondary),
            4.ESH(),
            CustomText(name, fontSize: 13, fontWeight: FW.bold),
            20.ESH(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.06), borderRadius: BorderRadius.circular(8)),
              child:  Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue, size: 20),
                  12.ESW(),
                  Expanded(
                    child: CustomText(
                      'SaaS Simulation: Document opening, editing, and downloading is enabled.',
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const CustomText('Close', fontWeight: FW.bold, color: Colors.grey),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
              Get.snackbar('File Downloaded', 'Successfully retrieved $name.');
            },
            icon: const Icon(Icons.download, size: 16),
            label: const CustomText('Open/Download', fontWeight: FW.bold, color: Colors.white),
            style: ElevatedButton.styleFrom(
              backgroundColor: titleColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────── VISITS HISTORY TIMELINE ───────────────────
  Widget _buildVisitsHistoryCard() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader('Visits History Timeline', Icons.history_rounded, Colors.purple),
          20.ESH(),
          _buildTimelineItem(
            date: '10 May 2026',
            doctor: 'Dr. Sarah Smith (General Practitioner)',
            reason: 'Routine quarterly diabetes assessment & medication refill',
            prescription: 'Metformin 500mg, Lisinopril 10mg',
            isLatest: true,
          ),
          _buildTimelineItem(
            date: '02 Feb 2026',
            doctor: 'Dr. John Doe (Cardiologist)',
            reason: 'Cardiology checkup, ECG monitoring and stress test',
            prescription: 'Aspirin 81mg once daily',
            isLatest: false,
          ),
          _buildTimelineItem(
            date: '15 Dec 2025',
            doctor: 'Dr. Sarah Smith (General Practitioner)',
            reason: 'Initial consultation & registration of basic medical profile',
            prescription: 'Multivitamins standard prescription',
            isLatest: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String date,
    required String doctor,
    required String reason,
    required String prescription,
    required bool isLatest,
    bool isLast = false,
  }) {
    final dotColor = isLatest ? AppColors.get.primary : Colors.grey.shade400;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: dotColor, width: 3.5),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 100.toH(),
                color: Colors.grey.shade200,
              ),
          ],
        ),
        24.ESW(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(date, fontSize: 12.5, fontWeight: FW.bold, color: dotColor),
                    if (isLatest) ...[
                      12.ESW(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.get.primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CustomText('Latest Visit', fontSize: 10.5, fontWeight: FW.bold, color: AppColors.get.primary),
                      ),
                    ],
                  ],
                ),
                8.ESH(),
                CustomText(doctor, fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textPrimary),
                6.ESH(),
                CustomText('Reason: $reason', fontSize: 12, color: AppColors.get.textSecondary),
                8.ESH(),
                Row(
                  children: [
                    const Icon(Icons.sticky_note_2_outlined, size: 14, color: Colors.purple),
                    6.ESW(),
                    CustomText('Rx: $prescription', fontSize: 11.5, fontWeight: FW.semiBold, color: Colors.purple.shade700),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────── HELPERS ───────────────────
  Widget _buildCardHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.toRad()),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        16.ESW(),
        CustomText(title, fontSize: 15, fontWeight: FW.bold, color: AppColors.get.textPrimary),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: CustomText(label, fontSize: 12.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
          ),
          Expanded(
            flex: 6,
            child: CustomText(value, fontSize: 13, color: AppColors.get.textPrimary, fontWeight: FW.semiBold),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataBox(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(
        child: CustomText(message, fontSize: 12, color: Colors.grey.shade500),
      ),
    );
  }
}
