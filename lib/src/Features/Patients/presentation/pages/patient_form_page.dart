import 'dart:io';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/core/patients_params.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patients_controller.dart';

class PatientFormPage extends StatefulWidget {
  final bool isEdit;
  const PatientFormPage({super.key, required this.isEdit});

  @override
  State<PatientFormPage> createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  final _formKey = GlobalKey<FormState>();
  final PatientsController controller = Get.find<PatientsController>();

  // Personal Info Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  String? selectedGender;
  String? selectedBloodType;
  File? _avatarFile;

  // Medical Info Controllers
  final notesController = TextEditingController();

  // Address Info Controllers
  final addressController = TextEditingController();

  // Emergency Contact Controllers
  final emergencyContactController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  // 1. Chronic Diseases State
  bool hasChronicDiseases = false;
  List<String> selectedDiseases = [];
  final customDiseaseController = TextEditingController();
  final List<String> _commonDiseases = [
    'Diabetes',
    'Hypertension',
    'Asthma',
    'Heart Disease',
    'Thyroid Disorder',
    'Arthritis'
  ];

  // 2. Current Medications State
  bool takingMedications = false;
  List<Map<String, String>> medicationList = [];

  // 3. Medical Attachments State
  List<Map<String, String>> attachmentsList = [];
  bool isUploading = false;

  static const _genders = ['Male', 'Female', 'Other'];
  static const _bloodTypes = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && controller.patients.isNotEmpty) {
      final p = controller.patients.first;
      nameController.text = p.name;
      phoneController.text = p.phone ?? '';
      emailController.text = p.email ?? '';
      addressController.text = p.address ?? '';
      notesController.text = p.medicalNotes ?? '';
      emergencyContactController.text = p.emergencyContact ?? '';
      emergencyPhoneController.text = p.emergencyPhone ?? '';
      dobController.text = p.dateOfBirth ?? '';
      selectedGender = p.gender;
      selectedBloodType = p.bloodType;

      // Seed chronic diseases, medications, and attachments if editing
      if (p.chronicDiseases != null && p.chronicDiseases!.isNotEmpty) {
        hasChronicDiseases = true;
        selectedDiseases = List<String>.from(p.chronicDiseases!);
      }
      if (p.medications != null && p.medications!.isNotEmpty) {
        takingMedications = true;
        medicationList = List<Map<String, String>>.from(p.medications!);
      }
      if (p.attachments != null && p.attachments!.isNotEmpty) {
        attachmentsList = List<Map<String, String>>.from(p.attachments!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: widget.isEdit ? 'Edit Patient Profile' : 'Register New Patient',
      breadcrumb: AppBreadcrumb(
        items: [
          const BreadcrumbItem(label: 'Patients', route: '/patients'),
          BreadcrumbItem(label: widget.isEdit ? 'Edit Profile' : 'Registration'),
        ],
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side preview panel
            SizedBox(
              width: 320.toW(),
              child: _buildSidePanel(),
            ),
            24.ESW(),
            // Right main form
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildBannerHeader(),
                    24.ESH(),

                    // Step 01: Personal Information
                    _buildSection(
                      step: '01',
                      title: 'Personal Information',
                      icon: Icons.person_rounded,
                      color: AppColors.get.primary,
                      children: [
                        _buildTwoColumn(
                          left: TextFieldDefault(
                            controller: nameController,
                            hint: const TFFHint(title: 'Full Name *'),
                            prefix: PrefixWithIconData(iconData: Icons.person_outline),
                            validation: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
                          ),
                          right: _buildGenderChips(),
                        ),
                        20.ESH(),
                        _buildTwoColumn(
                          left: TextFieldDefault(
                            controller: phoneController,
                            hint: const TFFHint(title: 'Phone Number *'),
                            prefix: PrefixWithIconData(iconData: Icons.phone_outlined),
                            keyboardType: TextInputType.phone,
                            validation: (v) {
                              if (v == null || v.trim().isEmpty) return 'Phone is required';
                              if (v.replaceAll(RegExp(r'\D'), '').length < 7) return 'Enter a valid phone';
                              return null;
                            },
                          ),
                          right: TextFieldDefault(
                            controller: emailController,
                            hint: const TFFHint(title: 'Email Address'),
                            prefix: PrefixWithIconData(iconData: Icons.email_outlined),
                            keyboardType: TextInputType.emailAddress,
                            validation: (v) {
                              if (v == null || v.isEmpty) return null;
                              if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(v)) return 'Invalid email';
                              return null;
                            },
                          ),
                        ),
                        20.ESH(),
                        _buildDatePicker(),
                      ],
                    ),
                    24.ESH(),

                    // Step 02: Medical Background
                    _buildSection(
                      step: '02',
                      title: 'Medical Background',
                      icon: Icons.medical_services_rounded,
                      color: Colors.red.shade400,
                      children: [
                        _buildBloodTypeGrid(),
                        20.ESH(),
                        TextFieldDefault(
                          controller: notesController,
                          hint: const TFFHint(title: 'General Medical History & Notes'),
                          maxLines: 3,
                        ),
                      ],
                    ),
                    24.ESH(),

                    // Step 03: Chronic Diseases & Medications Support
                    _buildSection(
                      step: '03',
                      title: 'Chronic Diseases & Medications',
                      icon: Icons.monitor_heart_rounded,
                      color: Colors.teal.shade500,
                      children: [
                        _buildChronicDiseasesSection(),
                        24.ESH(),
                        const Divider(),
                        24.ESH(),
                        _buildMedicationsSection(),
                      ],
                    ),
                    24.ESH(),

                    // Step 04: Medical Attachments System
                    _buildSection(
                      step: '04',
                      title: 'Medical Files & Attachments',
                      icon: Icons.attachment_rounded,
                      color: Colors.blue.shade500,
                      children: [
                        _buildAttachmentsSection(),
                      ],
                    ),
                    24.ESH(),

                    // Step 05: Address & Emergency Details
                    _buildSection(
                      step: '05',
                      title: 'Address & Emergency Contact',
                      icon: Icons.contact_emergency_rounded,
                      color: Colors.orange.shade600,
                      children: [
                        TextFieldDefault(
                          controller: addressController,
                          hint: const TFFHint(title: 'Home Address'),
                          prefix: PrefixWithIconData(iconData: Icons.map_outlined),
                        ),
                        20.ESH(),
                        _buildTwoColumn(
                          left: TextFieldDefault(
                            controller: emergencyContactController,
                            hint: const TFFHint(title: 'Emergency Contact Name'),
                            prefix: PrefixWithIconData(iconData: Icons.contact_emergency_outlined),
                          ),
                          right: TextFieldDefault(
                            controller: emergencyPhoneController,
                            hint: const TFFHint(title: 'Emergency Contact Phone'),
                            prefix: PrefixWithIconData(iconData: Icons.phone_callback_rounded),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    40.ESH(),

                    // Save / Discard Actions
                    _buildActionButtons(),
                    40.ESH(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────── BANNER HEADER ───────────────────
  Widget _buildBannerHeader() {
    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.get.primary, AppColors.get.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.toRad()),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.primary.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(14.toRad()),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14.toRad()),
            ),
            child: Icon(
              widget.isEdit ? Icons.edit_note_rounded : Icons.person_add_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          20.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  widget.isEdit ? 'Update Patient Records' : 'Register New Clinic Patient',
                  fontSize: 18,
                  fontWeight: FW.bold,
                  color: Colors.white,
                ),
                6.ESH(),
                CustomText(
                  'Fill all required fields (*). Adding chronic diseases, medications, and file scans guarantees complete logs.',
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.85),
                ),
              ],
            ),
          ),
          _buildProgressRing(),
        ],
      ),
    );
  }

  Widget _buildProgressRing() {
    int filled = 0;
    if (nameController.text.isNotEmpty) filled++;
    if (phoneController.text.isNotEmpty) filled++;
    final progress = filled / 2.0;

    return Column(
      children: [
        SizedBox(
          width: 52,
          height: 52,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.white.withOpacity(0.2),
                color: Colors.white,
                strokeWidth: 4,
              ),
              CustomText(
                '${(progress * 100).toInt()}%',
                fontSize: 13,
                fontWeight: FW.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
        6.ESH(),
        CustomText('Complete', fontSize: 11, color: Colors.white.withOpacity(0.8)),
      ],
    );
  }

  // ─────────────────── SIDE PREVIEW PANEL ───────────────────
  Widget _buildSidePanel() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: nameController,
      builder: (context, nameVal, _) {
        final initials = nameVal.text.trim().isEmpty
            ? '?'
            : nameVal.text.trim().split(' ').map((e) => e.isEmpty ? '' : e[0]).take(2).join().toUpperCase();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _buildAvatarSection(initials)),
              28.ESH(),
              if (nameVal.text.isNotEmpty) ...[
                Center(
                  child: CustomText(
                    nameVal.text.trim(),
                    fontSize: 16,
                    fontWeight: FW.bold,
                    textAlign: TextAlign.center,
                    color: AppColors.get.textPrimary,
                  ),
                ),
                4.ESH(),
                Center(
                  child: CustomText(
                    selectedGender ?? 'Gender not set',
                    fontSize: 12.5,
                    color: AppColors.get.textSecondary,
                  ),
                ),
                20.ESH(),
                Divider(color: AppColors.get.border),
                20.ESH(),
              ],
              _buildInfoRow(Icons.tag_rounded, 'ID', widget.isEdit ? '#PT-0001' : 'Auto-assigned'),
              12.ESH(),
              _buildInfoRow(Icons.calendar_today_rounded, 'Registered', 'Today'),
              12.ESH(),
              _buildInfoRow(
                Icons.circle,
                'Status',
                widget.isEdit ? 'Active' : 'New Patient',
                valueColor: widget.isEdit ? AppColors.get.success : AppColors.get.info,
              ),
              if (selectedBloodType != null) ...[
                12.ESH(),
                _buildInfoRow(Icons.bloodtype_rounded, 'Blood Type', selectedBloodType!, valueColor: Colors.red.shade500),
              ],

              // Medical Previews
              if (selectedDiseases.isNotEmpty) ...[
                20.ESH(),
                Divider(color: AppColors.get.border),
                20.ESH(),
                CustomText('Chronic Conditions', fontSize: 12, fontWeight: FW.bold, color: Colors.teal.shade700),
                8.ESH(),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: selectedDiseases.map((d) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.teal.shade200),
                    ),
                    child: CustomText(d, fontSize: 11, color: Colors.teal.shade800, fontWeight: FW.semiBold),
                  )).toList(),
                ),
              ],

              if (medicationList.isNotEmpty) ...[
                20.ESH(),
                Divider(color: AppColors.get.border),
                20.ESH(),
                CustomText('Medications (${medicationList.length})', fontSize: 12, fontWeight: FW.bold, color: Colors.red.shade700),
                8.ESH(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: medicationList.map((m) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        const Icon(Icons.medication_liquid_rounded, size: 14, color: Colors.red),
                        6.ESW(),
                        Expanded(
                          child: CustomText('${m['name']} (${m['dosage']})', fontSize: 11.5, color: AppColors.get.textPrimary, isOverFlow: true, maxLines: 1),
                        ),
                      ],
                    ),
                  )).toList(),
                ),
              ],

              if (attachmentsList.isNotEmpty) ...[
                20.ESH(),
                Divider(color: AppColors.get.border),
                20.ESH(),
                Row(
                  children: [
                    Icon(Icons.attachment_rounded, size: 16, color: Colors.blue.shade600),
                    8.ESW(),
                    CustomText('Medical Scans & Docs', fontSize: 12, fontWeight: FW.bold, color: Colors.blue.shade700),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CustomText('${attachmentsList.length}', fontSize: 11, fontWeight: FW.bold, color: Colors.blue.shade800),
                    ),
                  ],
                ),
              ],

              28.ESH(),
              Divider(color: AppColors.get.border),
              20.ESH(),
              Container(
                padding: EdgeInsets.all(14.toRad()),
                decoration: BoxDecoration(
                  color: AppColors.get.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.toRad()),
                  border: Border.all(color: AppColors.get.primary.withOpacity(0.15)),
                ),
                child: Column(
                  children: [
                    Icon(Icons.tips_and_updates_rounded, color: AppColors.get.primary, size: 22),
                    10.ESH(),
                    CustomText(
                      'Tip: Complete all sections for the best patient care experience.',
                      fontSize: 12,
                      color: AppColors.get.textSecondary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatarSection(String initials) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 100.toRad(),
            height: 100.toRad(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.get.primary, AppColors.get.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.get.primary.withOpacity(0.3),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
              image: _avatarFile != null
                  ? DecorationImage(image: FileImage(_avatarFile!), fit: BoxFit.cover)
                  : null,
            ),
            child: _avatarFile == null
                ? Center(
                    child: CustomText(initials, fontSize: 24, fontWeight: FW.bold, color: Colors.white),
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _pickAvatar,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.get.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 6),
                  ],
                ),
                child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickAvatar() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _avatarFile = File(result.files.single.path!);
      });
    }
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.get.textSecondary),
        8.ESW(),
        CustomText(label, fontSize: 12.5, color: AppColors.get.textSecondary),
        const Spacer(),
        CustomText(value, fontSize: 12.5, fontWeight: FW.bold, color: valueColor ?? AppColors.get.textPrimary),
      ],
    );
  }

  // ─────────────────── SECTION BUILDING ───────────────────
  Widget _buildSection({
    required String step,
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.toRad(),
                height: 32.toRad(),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.toRad()),
                ),
                child: Center(
                  child: CustomText(step, fontSize: 13.5, fontWeight: FW.bold, color: color),
                ),
              ),
              14.ESW(),
              Container(
                padding: EdgeInsets.all(9.toRad()),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10.toRad()),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              12.ESW(),
              CustomText(title, fontSize: 16, fontWeight: FW.bold, color: AppColors.get.textPrimary),
            ],
          ),
          20.ESH(),
          Divider(color: AppColors.get.border.withOpacity(0.5)),
          20.ESH(),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTwoColumn({required Widget left, required Widget right}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        20.ESW(),
        Expanded(child: right),
      ],
    );
  }

  // ─────────────────── GENDER CHIPS ───────────────────
  Widget _buildGenderChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.wc_rounded, size: 16, color: AppColors.get.textSecondary),
            6.ESW(),
            CustomText('Gender', fontSize: 12.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
          ],
        ),
        10.ESH(),
        Row(
          children: _genders.map((g) {
            final isSelected = selectedGender == g;
            final gIcon = g == 'Female'
                ? Icons.female_rounded
                : g == 'Male'
                    ? Icons.male_rounded
                    : Icons.transgender_rounded;
            final gColor = g == 'Female'
                ? Colors.pink.shade400
                : g == 'Male'
                    ? Colors.blue.shade500
                    : Colors.purple.shade400;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedGender = g),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: g != 'Other' ? 8.toW() : 0),
                  padding: EdgeInsets.symmetric(vertical: 12.toH()),
                  decoration: BoxDecoration(
                    color: isSelected ? gColor.withOpacity(0.08) : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12.toRad()),
                    border: Border.all(
                      color: isSelected ? gColor : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: gColor.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 3))]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Icon(gIcon, color: isSelected ? gColor : Colors.grey.shade400, size: 22),
                      6.ESH(),
                      CustomText(
                        g,
                        fontSize: 12,
                        fontWeight: isSelected ? FW.bold : FW.medium,
                        color: isSelected ? gColor : Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ─────────────────── BLOOD TYPE GRID ───────────────────
  Widget _buildBloodTypeGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bloodtype_rounded, size: 16, color: Colors.red.shade400),
            6.ESW(),
            CustomText('Blood Type', fontSize: 12.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
          ],
        ),
        12.ESH(),
        Wrap(
          spacing: 10.toW(),
          runSpacing: 10.toH(),
          children: _bloodTypes.map((bt) {
            final isSelected = selectedBloodType == bt;
            return GestureDetector(
              onTap: () => setState(() => selectedBloodType = bt),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 60.toRad(),
                height: 48.toRad(),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red.shade50 : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10.toRad()),
                  border: Border.all(
                    color: isSelected ? Colors.red.shade400 : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [BoxShadow(color: Colors.red.withOpacity(0.12), blurRadius: 6, offset: const Offset(0, 2))]
                      : [],
                ),
                child: Center(
                  child: CustomText(
                    bt,
                    fontSize: 13,
                    fontWeight: isSelected ? FW.bold : FW.semiBold,
                    color: isSelected ? Colors.red.shade600 : Colors.grey.shade500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ─────────────────── DATE PICKER ───────────────────
  Widget _buildDatePicker() {
    return TextFieldDefault(
      controller: dobController,
      hint: const TFFHint(title: 'Date of Birth'),
      prefix: PrefixWithIconData(iconData: Icons.cake_outlined),
      readOnly: true,
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime(1990),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: AppColors.get.primary),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          dobController.text = '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
        }
      },
    );
  }

  // ─────────────────── TASK 8: CHRONIC DISEASES SECTION ───────────────────
  Widget _buildChronicDiseasesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.healing_rounded, color: Colors.teal.shade600, size: 20),
            10.ESW(),
            CustomText('Chronic Diseases Support', fontSize: 14, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          ],
        ),
        8.ESH(),
        CustomText(
          'Indicate if this patient suffers from any long-term chronic conditions to help tailor their medical chart.',
          fontSize: 12,
          color: AppColors.get.textSecondary,
        ),
        16.ESH(),
        Row(
          children: [
            CustomText('Has Chronic Disease?', fontSize: 13, fontWeight: FW.bold),
            16.ESW(),
            _buildYesNoChips(
              value: hasChronicDiseases,
              onChanged: (v) {
                setState(() {
                  hasChronicDiseases = v;
                  if (!v) selectedDiseases.clear();
                });
              },
              activeColor: Colors.teal,
            ),
          ],
        ),
        if (hasChronicDiseases) ...[
          20.ESH(),
          CustomText('Select all matching diseases:', fontSize: 12.5, fontWeight: FW.medium, color: AppColors.get.textSecondary),
          12.ESH(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _commonDiseases.map((disease) {
              final isSelected = selectedDiseases.contains(disease);
              return FilterChip(
                label: CustomText(
                  disease,
                  fontSize: 12,
                  fontWeight: isSelected ? FW.bold : FW.medium,
                  color: isSelected ? Colors.white : AppColors.get.textPrimary,
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedDiseases.add(disease);
                    } else {
                      selectedDiseases.remove(disease);
                    }
                  });
                },
                selectedColor: Colors.teal,
                checkmarkColor: Colors.white,
                backgroundColor: Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: isSelected ? Colors.teal : Colors.grey.shade200),
                ),
              );
            }).toList(),
          ),
          20.ESH(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: customDiseaseController,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Add Custom Disease (e.g. Celiac disease)',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.teal.shade500),
                    ),
                  ),
                ),
              ),
              12.ESW(),
              ElevatedButton.icon(
                onPressed: () {
                  final text = customDiseaseController.text.trim();
                  if (text.isNotEmpty) {
                    setState(() {
                      if (!selectedDiseases.contains(text)) {
                        selectedDiseases.add(text);
                        if (!_commonDiseases.contains(text)) {
                          _commonDiseases.add(text);
                        }
                      }
                      customDiseaseController.clear();
                    });
                  }
                },
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const CustomText('Add', fontWeight: FW.bold, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 16.toH()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  // ─────────────────── TASK 9: CURRENT MEDICATIONS SECTION ───────────────────
  Widget _buildMedicationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.medication_liquid_rounded, color: Colors.red.shade600, size: 20),
            10.ESW(),
            CustomText('Current Medications Support', fontSize: 14, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          ],
        ),
        8.ESH(),
        CustomText(
          'Document drugs and dosage schedules the patient is currently administering.',
          fontSize: 12,
          color: AppColors.get.textSecondary,
        ),
        16.ESH(),
        Row(
          children: [
            CustomText('Currently taking medication?', fontSize: 13, fontWeight: FW.bold),
            16.ESW(),
            _buildYesNoChips(
              value: takingMedications,
              onChanged: (v) {
                setState(() {
                  takingMedications = v;
                  if (!v) medicationList.clear();
                });
              },
              activeColor: Colors.red,
            ),
          ],
        ),
        if (takingMedications) ...[
          20.ESH(),
          if (medicationList.isEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Center(
                child: CustomText(
                  'No medications added yet. Click "+ Add Medication Entry" below to register one.',
                  fontSize: 12,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else
            Column(
              children: List.generate(medicationList.length, (index) => _buildMedicationEntryRow(index)),
            ),
          16.ESH(),
          TextButton.icon(
            onPressed: () {
              setState(() {
                medicationList.add({'name': '', 'dosage': '', 'notes': ''});
              });
            },
            icon: const Icon(Icons.add_rounded, size: 20, color: Colors.red),
            label: CustomText('Add Medication Entry', fontWeight: FW.bold, color: Colors.red.shade700, fontSize: 12.5),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMedicationEntryRow(int index) {
    final med = medicationList[index];
    final nameController = TextEditingController(text: med['name']);
    final dosageController = TextEditingController(text: med['dosage']);
    final notesController = TextEditingController(text: med['notes']);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: _buildMedInputField(
                hint: 'Medication Name',
                controller: nameController,
                onChanged: (v) => medicationList[index]['name'] = v,
              ),
            ),
            10.ESW(),
            Expanded(
              flex: 2,
              child: _buildMedInputField(
                hint: 'Dosage (e.g. 500mg)',
                controller: dosageController,
                onChanged: (v) => medicationList[index]['dosage'] = v,
              ),
            ),
            10.ESW(),
            Expanded(
              flex: 3,
              child: _buildMedInputField(
                hint: 'Notes (e.g. Twice daily)',
                controller: notesController,
                onChanged: (v) => medicationList[index]['notes'] = v,
              ),
            ),
            10.ESW(),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
              onPressed: () {
                setState(() {
                  medicationList.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedInputField({
    required String hint,
    required TextEditingController controller,
    required void Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 12.5),
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.toW(), vertical: 12.toH()),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  // ─────────────────── TASK 10 & 11: MEDICAL ATTACHMENTS SYSTEM ───────────────────
  Widget _buildAttachmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.folder_shared_rounded, color: Colors.blue.shade600, size: 20),
            10.ESW(),
            CustomText('Medical Attachments Upload System', fontSize: 14, fontWeight: FW.bold, color: AppColors.get.textPrimary),
          ],
        ),
        8.ESH(),
        CustomText(
          'Upload medical reports, MRI scans, laboratory blood tests, invoices, and physical records (Images, PDF, Excel sheets supported).',
          fontSize: 12,
          color: AppColors.get.textSecondary,
        ),
        20.ESH(),

        // Drag & Drop styled area
      GestureDetector(
  onTap: _pickFiles,
  child: DottedBorder(
    options: RoundedRectDottedBorderOptions(
      dashPattern: [10, 5],
      strokeWidth: 2,
      radius: Radius.circular(16),
      color: Colors.indigo,
      padding: EdgeInsets.all(16),
    ),

    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          if (isUploading) ...[
            const CircularProgressIndicator(),
            12.ESH(),
            CustomText(
              'Uploading files, please wait...',
              fontSize: 12,
              color: Colors.blue.shade700,
              fontWeight: FW.bold,
            ),
          ] else ...[
            Icon(
              Icons.cloud_upload_outlined,
              size: 42,
              color: Colors.blue.shade600,
            ),
            12.ESH(),
            const CustomText(
              'Click here to browse files',
              fontSize: 13,
              fontWeight: FW.bold,
            ),
            6.ESH(),
            CustomText(
              'Supports: JPEG, PNG, PDF document, Excel (XLSX)',
              fontSize: 11.5,
              color: AppColors.get.textSecondary,
            ),
          ],
        ],
      ),
    ),
 
  ),
),      // Picked files list
        if (attachmentsList.isNotEmpty) ...[
          20.ESH(),
          CustomText('Selected Files (${attachmentsList.length}):', fontSize: 13, fontWeight: FW.bold),
          12.ESH(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: attachmentsList.length,
            itemBuilder: (context, index) {
              final file = attachmentsList[index];
              final name = file['name'] ?? '';
              final type = file['type'] ?? 'IMAGE';

              IconData icon;
              Color iconColor;

              if (type == 'PDF') {
                icon = Icons.picture_as_pdf_rounded;
                iconColor = Colors.red.shade600;
              } else if (type == 'EXCEL') {
                icon = Icons.table_view_rounded;
                iconColor = Colors.green.shade600;
              } else {
                icon = Icons.image_rounded;
                iconColor = Colors.blue.shade600;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: iconColor, size: 24),
                      16.ESW(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(name, fontSize: 12.5, fontWeight: FW.bold, isOverFlow: true, maxLines: 1),
                            4.ESH(),
                            CustomText(type, fontSize: 10.5, color: AppColors.get.textSecondary),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel_rounded, color: Colors.grey, size: 20),
                        onPressed: () {
                          setState(() {
                            attachmentsList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }

  void _pickFiles() async {
    setState(() => isUploading = true);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'xls', 'xlsx'],
        allowMultiple: true,
      );

      if (result != null) {
        for (var file in result.files) {
          final name = file.name;
          final path = file.path ?? '';
          String type = 'IMAGE';

          if (name.toLowerCase().endsWith('.pdf')) {
            type = 'PDF';
          } else if (name.toLowerCase().endsWith('.xls') || name.toLowerCase().endsWith('.xlsx')) {
            type = 'EXCEL';
          }

          setState(() {
            attachmentsList.add({
              'name': name,
              'path': path,
              'type': type,
            });
          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick files');
    } finally {
      setState(() => isUploading = false);
    }
  }

  // Helper YES / NO chips
  Widget _buildYesNoChips({
    required bool value,
    required void Function(bool) onChanged,
    required Color activeColor,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(true),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: value ? activeColor.withOpacity(0.12) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: value ? activeColor : Colors.grey.shade200, width: value ? 1.5 : 1),
            ),
            child: CustomText(
              'Yes',
              fontSize: 12,
              fontWeight: value ? FW.bold : FW.medium,
              color: value ? activeColor : Colors.grey.shade600,
            ),
          ),
        ),
        10.ESW(),
        GestureDetector(
          onTap: () => onChanged(false),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: !value ? activeColor.withOpacity(0.12) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: !value ? activeColor : Colors.grey.shade200, width: !value ? 1.5 : 1),
            ),
            child: CustomText(
              'No',
              fontSize: 12,
              fontWeight: !value ? FW.bold : FW.medium,
              color: !value ? activeColor : Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────── ACTION BUTTONS ───────────────────
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close_rounded, size: 18, color: Colors.grey.shade500),
          label: CustomText('Discard', fontWeight: FW.bold, color: Colors.grey.shade600, fontSize: 13),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 28.toW(), vertical: 18.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.toRad())),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        20.ESW(),
        GetBuilder<PatientsController>(
          id: 'patients_table',
          builder: (cnt) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.get.primary, AppColors.get.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.toRad()),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.get.primary.withOpacity(0.35),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: cnt.isSubmitting ? null : _submit,
                icon: cnt.isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : Icon(
                        widget.isEdit ? Icons.save_rounded : Icons.check_circle_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                label: CustomText(
                  cnt.isSubmitting
                      ? 'Saving...'
                      : widget.isEdit
                          ? 'Save Changes'
                          : 'Complete Registration',
                  fontWeight: FW.bold,
                  color: Colors.white,
                  fontSize: 13,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 36.toW(), vertical: 18.toH()),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.toRad())),
                  elevation: 0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // ─────────────────── SUBMIT FORM ───────────────────
  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final params = AddPatientParams(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.isEmpty ? null : emailController.text.trim(),
      gender: selectedGender,
      bloodType: selectedBloodType,
      address: addressController.text.isEmpty ? null : addressController.text.trim(),
      medicalNotes: notesController.text.isEmpty ? null : notesController.text.trim(),
      emergencyContact: emergencyContactController.text.isEmpty ? null : emergencyContactController.text.trim(),
      emergencyPhone: emergencyPhoneController.text.isEmpty ? null : emergencyPhoneController.text.trim(),
      chronicDiseases: selectedDiseases.isNotEmpty ? selectedDiseases : null,
      medications: medicationList.isNotEmpty ? medicationList : null,
      attachments: attachmentsList.isNotEmpty ? attachmentsList : null,
    );

    final success = await controller.savePatient(params);
    if (success && mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    notesController.dispose();
    emergencyContactController.dispose();
    emergencyPhoneController.dispose();
    dobController.dispose();
    customDiseaseController.dispose();
    super.dispose();
  }
}
