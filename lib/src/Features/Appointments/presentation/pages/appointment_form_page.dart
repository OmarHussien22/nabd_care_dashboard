import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Features/Appointments/presentation/manager/appointments_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patients_controller.dart';

class AppointmentFormPage extends StatefulWidget {
  final bool isEdit;
  final int? appointmentId;

  const AppointmentFormPage({
    super.key,
    required this.isEdit,
    this.appointmentId,
  });

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _PatientDropdownItem {
  final String name;
  final String initials;
  _PatientDropdownItem(this.name, this.initials);
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  final _formKey = GlobalKey<FormState>();
  final AppointmentsController controller = Get.put(AppointmentsController());
  final PatientsController patientsController = Get.put(PatientsController());

  String? selectedPatient;
  String? selectedDoctor;
  String? selectedVisitType = 'Consultation';
  String? selectedStatus = 'Confirmed';

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final notesController = TextEditingController();

  final List<String> _doctors = ['Dr. Sarah Bennett', 'Dr. Robert Fox', 'Dr. John Doe'];
  final List<String> _visitTypes = ['Consultation', 'Follow-up', 'Emergency', 'Check-up'];
  final List<String> _statuses = ['Pending', 'Confirmed', 'Completed', 'Cancelled'];

  List<_PatientDropdownItem> _availablePatients = [];

  @override
  void initState() {
    super.initState();
    // Default select first doctor to prevent null dropdown values
    selectedDoctor = _doctors.first;
    _loadPatientsList();

    if (widget.isEdit && widget.appointmentId != null) {
      final appt = controller.appointments.firstWhere(
        (element) => element.id == widget.appointmentId,
        orElse: () => controller.appointments.first,
      );
      selectedPatient = appt.patientName;
      selectedDoctor = appt.doctorName;
      selectedVisitType = appt.visitType;
      selectedStatus = appt.status;
      dateController.text = appt.date;
      timeController.text = appt.time;
      // Re-load list to guarantee that the selected edited patient is inserted into the dropdown items list
      _loadPatientsList();
    } else {
      // Set defaults for new
      dateController.text = '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';
      timeController.text = '09:00 AM';
    }
  }

  void _loadPatientsList() {
    // Collect from PatientsController or seed defaults
    final list = <_PatientDropdownItem>[];
    final seenNames = <String>{};

    if (patientsController.patients.isNotEmpty) {
      for (var p in patientsController.patients) {
        if (!seenNames.contains(p.name)) {
          seenNames.add(p.name);
          list.add(_PatientDropdownItem(p.name, p.initials));
        }
      }
    } else {
      final seedList = [
        _PatientDropdownItem('Ahmed Ali', 'AA'),
        _PatientDropdownItem('Sarah Jane', 'SJ'),
        _PatientDropdownItem('Michael Ross', 'MR'),
        _PatientDropdownItem('Emma Wilson', 'EW'),
        _PatientDropdownItem('John Smith', 'JS'),
      ];
      for (var item in seedList) {
        if (!seenNames.contains(item.name)) {
          seenNames.add(item.name);
          list.add(item);
        }
      }
    }

    // Defensive check: Ensure that if a patient name is preselected (e.g. during reschedule edit),
    // it is guaranteed to be in the dropdown items list, avoiding the dropdown value assertion fail.
    if (selectedPatient != null && !seenNames.contains(selectedPatient)) {
      seenNames.add(selectedPatient!);
      final initials = selectedPatient!.split(' ').map((e) => e.isEmpty ? '' : e[0]).take(2).join().toUpperCase();
      list.add(_PatientDropdownItem(selectedPatient!, initials));
    }

    setState(() {
      _availablePatients = list;
      if (selectedPatient == null && _availablePatients.isNotEmpty) {
        selectedPatient = _availablePatients.first.name;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: widget.isEdit ? 'Reschedule Appointment' : 'Book New Appointment',
      breadcrumb: AppBreadcrumb(
        items: [
          const BreadcrumbItem(label: 'Appointments', route: '/appointments'),
          BreadcrumbItem(label: widget.isEdit ? 'Reschedule' : 'Booking'),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side Panel: Live summary card
            SizedBox(
              width: 320.toW(),
              child: _buildSummaryPanel(),
            ),
            24.ESW(),
            // Right Side Panel: Main form inputs
            Expanded(
              child: Column(
                children: [
                  _buildHeaderBanner(),
                  24.ESH(),
                  _buildFormSection(),
                  40.ESH(),
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────── LEFT PANEL WIDGETS ───────────────────
  Widget _buildSummaryPanel() {
    final initials = selectedPatient == null
        ? '?'
        : selectedPatient!.split(' ').map((e) => e[0]).take(2).join().toUpperCase();

    return Container(
      padding: EdgeInsets.all(24.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.015), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40.toRad(),
              backgroundColor: AppColors.get.primary.withOpacity(0.12),
              child: CustomText(
                initials,
                fontSize: 22,
                fontWeight: FW.bold,
                color: AppColors.get.primary,
              ),
            ),
          ),
          24.ESH(),
          Center(
            child: CustomText(
              selectedPatient ?? 'Select Patient',
              fontSize: 16,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
          ),
          6.ESH(),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: CustomText(
                selectedVisitType ?? 'Consultation',
                fontSize: 11.5,
                fontWeight: FW.bold,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          20.ESH(),
          const Divider(),
          20.ESH(),

          _buildSummaryRow(Icons.medical_services_outlined, 'Attending Doctor', selectedDoctor ?? 'Not assigned'),
          14.ESH(),
          _buildSummaryRow(Icons.calendar_today_outlined, 'Slotted Date', dateController.text),
          14.ESH(),
          _buildSummaryRow(Icons.access_time_rounded, 'Slotted Time', timeController.text),
          if (widget.isEdit) ...[
            14.ESH(),
            _buildSummaryRow(Icons.circle_outlined, 'Current Status', selectedStatus ?? 'Confirmed', statusColor: true),
          ],

          28.ESH(),
          const Divider(),
          20.ESH(),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.get.primary.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.get.primary.withOpacity(0.12)),
            ),
            child: Column(
              children: [
                const Icon(Icons.info_outline_rounded, color: Colors.blue, size: 22),
                8.ESH(),
                const CustomText(
                  'Make sure there are no schedule conflicts for the chosen doctor at this time.',
                  fontSize: 11.5,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value, {bool statusColor = false}) {
    Color valColor = AppColors.get.textPrimary;
    if (statusColor) {
      if (value == 'Completed') valColor = Colors.green;
      if (value == 'Cancelled') valColor = Colors.red;
      if (value == 'Pending') valColor = Colors.orange;
      if (value == 'Confirmed') valColor = Colors.blue;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.get.textSecondary),
        10.ESW(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(label, fontSize: 11, color: AppColors.get.textSecondary),
              3.ESH(),
              CustomText(value, fontSize: 12.5, fontWeight: FW.bold, color: valColor, maxLines: 1, isOverFlow: true),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────── HEADER BANNER WIDGET ───────────────────
  Widget _buildHeaderBanner() {
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
          BoxShadow(color: AppColors.get.primary.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.18), borderRadius: BorderRadius.circular(12)),
            child: Icon(
              widget.isEdit ? Icons.edit_calendar_rounded : Icons.add_moderator_rounded,
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
                  widget.isEdit ? 'Reschedule Clinical Appointment' : 'Book a New Clinical Consultation',
                  fontSize: 18,
                  fontWeight: FW.bold,
                  color: Colors.white,
                ),
                4.ESH(),
                CustomText(
                  'Set visit type, assign specialist doctors, and reserve slots instantly in real-time.',
                  fontSize: 12.5,
                  color: Colors.white.withOpacity(0.85),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────── FORM ENTRY WIDGETS ───────────────────
  Widget _buildFormSection() {
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
          // Row 1: Patient Selection & Doctor
          Row(
            children: [
              Expanded(
                child: _buildLabelDropdown(
                  label: 'Choose Patient *',
                  icon: Icons.person_outline_rounded,
                  child: DropdownButtonFormField<String>(
                    value: selectedPatient,
                    decoration: _buildInputDecoration(),
                    items: _availablePatients.map((p) => DropdownMenuItem(value: p.name, child: Text(p.name))).toList(),
                    onChanged: (v) => setState(() => selectedPatient = v),
                    validator: (v) => v == null ? 'Patient selection is required' : null,
                  ),
                ),
              ),
              20.ESW(),
              Expanded(
                child: _buildLabelDropdown(
                  label: 'Assign Specialist Doctor *',
                  icon: Icons.badge_outlined,
                  child: DropdownButtonFormField<String>(
                    value: selectedDoctor,
                    decoration: _buildInputDecoration(),
                    items: _doctors.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                    onChanged: (v) => setState(() => selectedDoctor = v),
                    validator: (v) => v == null ? 'Doctor selection is required' : null,
                  ),
                ),
              ),
            ],
          ),
          20.ESH(),

          // Row 2: Date & Time Pickers
          Row(
            children: [
              Expanded(
                child: _buildLabelDropdown(
                  label: 'Appointment Date *',
                  icon: Icons.calendar_month_outlined,
                  child: TextFieldDefault(
                    controller: dateController,
                    hint: const TFFHint(title: 'Choose Date'),
                    prefix: PrefixWithIconData(iconData: Icons.cake_outlined),
                    readOnly: true,
                    onTap: _pickDate,
                  ),
                ),
              ),
              20.ESW(),
              Expanded(
                child: _buildLabelDropdown(
                  label: 'Time Slot *',
                  icon: Icons.access_time_rounded,
                  child: TextFieldDefault(
                    controller: timeController,
                    hint: const TFFHint(title: 'Select Time Slot'),
                    prefix: PrefixWithIconData(iconData: Icons.more_time_rounded),
                    readOnly: true,
                    onTap: _pickTime,
                  ),
                ),
              ),
            ],
          ),
          20.ESH(),

          // Row 3: Visit Types Wrap
          _buildVisitTypeChips(),
          20.ESH(),

          if (widget.isEdit) ...[
            _buildStatusChips(),
            20.ESH(),
          ],

          // Row 4: Notes
          _buildLabelDropdown(
            label: 'Administrative Notes / Consultation Reasons',
            icon: Icons.notes_rounded,
            child: TextField(
              controller: notesController,
              maxLines: 3,
              style: const TextStyle(fontSize: 13),
              decoration: _buildInputDecoration(hint: 'Describe the main cause, specific allergies or details...'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelDropdown({required String label, required IconData icon, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.get.textSecondary),
            8.ESW(),
            CustomText(label, fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textSecondary),
          ],
        ),
        8.ESH(),
        child,
      ],
    );
  }

  InputDecoration _buildInputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.get.primary)),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  Widget _buildVisitTypeChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.style_outlined, size: 16, color: AppColors.get.textSecondary),
            8.ESW(),
            CustomText('Visit Type *', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textSecondary),
          ],
        ),
        10.ESH(),
        Row(
          children: _visitTypes.map((vt) {
            final isSelected = selectedVisitType == vt;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedVisitType = vt),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.withOpacity(0.08) : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade200, width: isSelected ? 1.8 : 1),
                  ),
                  child: Center(
                    child: CustomText(
                      vt,
                      fontSize: 12.5,
                      fontWeight: isSelected ? FW.bold : FW.medium,
                      color: isSelected ? Colors.blue.shade700 : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStatusChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle_outlined, size: 16, color: AppColors.get.textSecondary),
            8.ESW(),
            CustomText('Appointment Status *', fontSize: 13, fontWeight: FW.bold, color: AppColors.get.textSecondary),
          ],
        ),
        10.ESH(),
        Row(
          children: _statuses.map((st) {
            final isSelected = selectedStatus == st;
            Color statusColor = Colors.orange;
            if (st == 'Confirmed') statusColor = Colors.blue;
            if (st == 'Completed') statusColor = Colors.green;
            if (st == 'Cancelled') statusColor = Colors.red;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedStatus = st),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? statusColor.withOpacity(0.08) : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isSelected ? statusColor : Colors.grey.shade200, width: isSelected ? 1.8 : 1),
                  ),
                  child: Center(
                    child: CustomText(
                      st,
                      fontSize: 12.5,
                      fontWeight: isSelected ? FW.bold : FW.medium,
                      color: isSelected ? statusColor : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: AppColors.get.primary)),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: AppColors.get.primary)),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }

  // ─────────────────── ACTIONS WIDGETS ───────────────────
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
        GetBuilder<AppointmentsController>(
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
                  BoxShadow(color: AppColors.get.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 5)),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: cnt.isLoading.value ? null : _submit,
                icon: cnt.isLoading.value
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
                  cnt.isLoading.value
                      ? 'Saving...'
                      : widget.isEdit
                          ? 'Reschedule'
                          : 'Book Appointment',
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

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (selectedPatient == null || selectedDoctor == null) {
      Get.snackbar('Input Error', 'Please complete all required fields (*)');
      return;
    }

    bool success;
    if (widget.isEdit && widget.appointmentId != null) {
      success = await controller.editAppointment(
        id: widget.appointmentId!,
        time: timeController.text.trim(),
        date: dateController.text.trim(),
        doctorName: selectedDoctor!,
        visitType: selectedVisitType!,
        status: selectedStatus!,
      );
    } else {
      success = await controller.createAppointment(
        patientName: selectedPatient!,
        doctorName: selectedDoctor!,
        time: timeController.text.trim(),
        date: dateController.text.trim(),
        visitType: selectedVisitType!,
      );
    }

    if (success && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
