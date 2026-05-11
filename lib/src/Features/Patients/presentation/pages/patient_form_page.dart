import 'dart:io';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();
  final emergencyContactController = TextEditingController();
  final emergencyPhoneController = TextEditingController();
  final dobController = TextEditingController();

  String? selectedGender;
  String? selectedBloodType;
  File? _avatarFile;

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
            // Left side panel
            SizedBox(
              width: 260.toRad(),
              child: _buildSidePanel(),
            ),
            24.ESW(),
            // Right main form
            Expanded(
              child: Column(
                children: [
                  _buildBannerHeader(),
                  24.ESH(),
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
                        hint: const TFFHint(title: 'Medical History & Notes (allergies, conditions, medications...)'),
                        maxLines: 4,
                      ),
                    ],
                  ),
                  24.ESH(),
                  _buildSection(
                    step: '03',
                    title: 'Address & Contact',
                    icon: Icons.location_on_rounded,
                    color: Colors.purple.shade400,
                    children: [
                      TextFieldDefault(
                        controller: addressController,
                        hint: const TFFHint(title: 'Home Address'),
                        prefix: PrefixWithIconData(iconData: Icons.map_outlined),
                      ),
                    ],
                  ),
                  24.ESH(),
                  _buildSection(
                    step: '04',
                    title: 'Emergency Contact',
                    icon: Icons.contact_emergency_rounded,
                    color: Colors.orange.shade600,
                    children: [
                      _buildTwoColumn(
                        left: TextFieldDefault(
                          controller: emergencyContactController,
                          hint: const TFFHint(title: 'Contact Name'),
                          prefix: PrefixWithIconData(iconData: Icons.contact_emergency_outlined),
                        ),
                        right: TextFieldDefault(
                          controller: emergencyPhoneController,
                          hint: const TFFHint(title: 'Emergency Phone'),
                          prefix: PrefixWithIconData(iconData: Icons.phone_callback_rounded),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  40.ESH(),
                  _buildActionButtons(),
                  24.ESH(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────── BANNER ───────────────────
  Widget _buildBannerHeader() {
    return Container(
      padding: EdgeInsets.all(22.toRad()),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.get.primary, AppColors.get.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.toRad()),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.primary.withValues(alpha: 0.3),
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
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(14.toRad()),
            ),
            child: Icon(
              widget.isEdit ? Icons.edit_note_rounded : Icons.person_add_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          20.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  widget.isEdit ? 'Update Patient Records' : 'Register New Clinic Patient',
                  fontSize: 5.5,
                  fontWeight: FW.bold,
                  color: Colors.white,
                ),
                6.ESH(),
                CustomText(
                  'Fill all required fields (*). Medical info helps doctors provide better care.',
                  fontSize: 3.5,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ],
            ),
          ),
          // Progress indicator
          _buildProgressRing(),
        ],
      ),
    );
  }

  Widget _buildProgressRing() {
    // Count filled required fields out of 2
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
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                color: Colors.white,
                strokeWidth: 4,
              ),
              CustomText(
                '${(progress * 100).toInt()}%',
                fontSize: 3.5,
                fontWeight: FW.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
        6.ESH(),
        CustomText('Complete', fontSize: 3, color: Colors.white.withValues(alpha: 0.8)),
      ],
    );
  }

  // ─────────────────── SIDE PANEL ───────────────────
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
            border: Border.all(color: AppColors.get.border.withValues(alpha: 0.5)),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 12, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            children: [
              // Avatar
              _buildAvatarSection(initials),
              28.ESH(),

              // Live name preview
              if (nameVal.text.isNotEmpty) ...[
                CustomText(
                  nameVal.text.trim(),
                  fontSize: 5,
                  fontWeight: FW.bold,
                  textAlign: TextAlign.center,
                  color: AppColors.get.textPrimary,
                ),
                6.ESH(),
                CustomText(
                  selectedGender ?? 'Gender not set',
                  fontSize: 3.5,
                  color: AppColors.get.textSecondary,
                ),
                20.ESH(),
                Divider(color: AppColors.get.border),
                20.ESH(),
              ],

              // Info rows
              _buildInfoRow(Icons.tag_rounded, 'ID', widget.isEdit ? '#PT-0021' : 'Auto-assigned'),
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

              28.ESH(),
              Divider(color: AppColors.get.border),
              20.ESH(),

              // Quick tips
              Container(
                padding: EdgeInsets.all(14.toRad()),
                decoration: BoxDecoration(
                  color: AppColors.get.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.toRad()),
                  border: Border.all(color: AppColors.get.primary.withValues(alpha: 0.15)),
                ),
                child: Column(
                  children: [
                    Icon(Icons.tips_and_updates_rounded, color: AppColors.get.primary, size: 22),
                    10.ESH(),
                    CustomText(
                      'Tip: Complete all sections for the best patient care experience.',
                      fontSize: 3.3,
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
                  color: AppColors.get.primary.withValues(alpha: 0.3),
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
                    child: CustomText(initials, fontSize: 9, fontWeight: FW.bold, color: Colors.white),
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {}, // TODO: image picker
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.get.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 6),
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

  Widget _buildInfoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.get.textSecondary),
        8.ESW(),
        CustomText(label, fontSize: 3.5, color: AppColors.get.textSecondary),
        const Spacer(),
        CustomText(value, fontSize: 3.5, fontWeight: FW.bold, color: valueColor ?? AppColors.get.textPrimary),
      ],
    );
  }

  // ─────────────────── SECTION CARD ───────────────────
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
        border: Border.all(color: AppColors.get.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 12, offset: const Offset(0, 4)),
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
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.toRad()),
                ),
                child: Center(
                  child: CustomText(step, fontSize: 4, fontWeight: FW.bold, color: color),
                ),
              ),
              14.ESW(),
              Container(
                padding: EdgeInsets.all(9.toRad()),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10.toRad()),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              12.ESW(),
              CustomText(title, fontSize: 5, fontWeight: FW.bold, color: AppColors.get.textPrimary),
            ],
          ),
          20.ESH(),
          Divider(color: AppColors.get.border.withValues(alpha: 0.5)),
          20.ESH(),
          ...children,
        ],
      ),
    );
  }

  // ─────────────────── GENDER CHIPS ───────────────────
  Widget _buildGenderChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.wc_rounded, size: 15, color: AppColors.get.textSecondary),
            6.ESW(),
            CustomText('Gender', fontSize: 3.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
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
                    color: isSelected ? gColor.withValues(alpha: 0.1) : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12.toRad()),
                    border: Border.all(
                      color: isSelected ? gColor : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: gColor.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 3))]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Icon(gIcon, color: isSelected ? gColor : Colors.grey.shade400, size: 22),
                      6.ESH(),
                      CustomText(
                        g,
                        fontSize: 3.5,
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
            Icon(Icons.bloodtype_rounded, size: 15, color: Colors.red.shade400),
            6.ESW(),
            CustomText('Blood Type', fontSize: 3.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
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
                      ? [BoxShadow(color: Colors.red.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 3))]
                      : [],
                ),
                child: Center(
                  child: CustomText(
                    bt,
                    fontSize: 4,
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

  // ─────────────────── TWO COLUMN ───────────────────
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

  // ─────────────────── ACTION BUTTONS ───────────────────
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close_rounded, size: 18, color: Colors.grey.shade500),
          label: CustomText('Discard', fontWeight: FW.bold, color: Colors.grey.shade600),
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
                    color: AppColors.get.primary.withValues(alpha: 0.35),
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
                  fontSize: 4,
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

  // ─────────────────── SUBMIT ───────────────────
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
    super.dispose();
  }
}
