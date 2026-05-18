import 'package:care_desk/src/Core/Utils/Extensions/extract_string.dart';
import 'package:care_desk/src/Core/utils/general_utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import 'package:care_desk/src/Features/Appointments/presentation/manager/appointments_controller.dart';

class AppointmentsCalendarPage extends StatefulWidget {
  const AppointmentsCalendarPage({super.key});

  @override
  State<AppointmentsCalendarPage> createState() =>
      _AppointmentsCalendarPageState();
}

class _AppointmentsCalendarPageState extends State<AppointmentsCalendarPage> {
  final AppointmentsController controller = Get.put(AppointmentsController());

  // View States: 'month', 'week', 'day'
  String _activeView = 'month';
  DateTime _currentDate = DateTime(2026, 5, 17); // Set to simulated timestamp

  final List<String> _weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: 'Appointments Calendar',
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Appointments', route: '/appointments'),
          BreadcrumbItem(label: 'Calendar View'),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () => context.go('/appointments'),
          icon: const Icon(Icons.table_rows_rounded, size: 18),
          label: const CustomText('Table List View', fontWeight: FW.bold),
          style: OutlinedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 14.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.toRad())),
            side: BorderSide(color: AppColors.get.border),
          ),
        ),
        12.ESW(),
        ElevatedButton.icon(
          onPressed: () => context.go('/appointments/create'),
          icon: const Icon(Icons.add_rounded, size: 20),
          label: const CustomText('Book Slot',
              fontWeight: FW.bold, color: Colors.white),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 14.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: Column(
        children: [
          _buildCalendarToolbar(),
          24.ESH(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Calendar View
              Expanded(
                flex: 7,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildActiveViewWidget(),
                ),
              ),
              24.ESW(),
              // Right side details & schedules summary
              Expanded(
                flex: 3,
                child: _buildRightSidebar(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────── TOOLBAR CONTROLS ───────────────────
  Widget _buildCalendarToolbar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Date selection title & navigators
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                onPressed: () => setState(() {
                  if (_activeView == 'month') {
                    _currentDate =
                        DateTime(_currentDate.year, _currentDate.month - 1, 1);
                  } else if (_activeView == 'week') {
                    _currentDate =
                        _currentDate.subtract(const Duration(days: 7));
                  } else {
                    _currentDate =
                        _currentDate.subtract(const Duration(days: 1));
                  }
                }),
              ),
              12.ESW(),
              CustomText(
                _getToolbarTitle(),
                fontSize: 16,
                fontWeight: FW.bold,
                color: AppColors.get.textPrimary,
              ),
              12.ESW(),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                onPressed: () => setState(() {
                  if (_activeView == 'month') {
                    _currentDate =
                        DateTime(_currentDate.year, _currentDate.month + 1, 1);
                  } else if (_activeView == 'week') {
                    _currentDate = _currentDate.add(const Duration(days: 7));
                  } else {
                    _currentDate = _currentDate.add(const Duration(days: 1));
                  }
                }),
              ),
            ],
          ),

          // View switches: Month / Week / Day
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _buildViewToggleTab('month', 'Month'),
                _buildViewToggleTab('week', 'Week'),
                _buildViewToggleTab('day', 'Day'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewToggleTab(String viewMode, String label) {
    final isActive = _activeView == viewMode;
    return GestureDetector(
      onTap: () => setState(() => _activeView = viewMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isActive
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 2))
                ]
              : [],
        ),
        child: CustomText(
          label,
          fontSize: 12.5,
          fontWeight: isActive ? FW.bold : FW.medium,
          color: isActive ? AppColors.get.primary : Colors.grey.shade600,
        ),
      ),
    );
  }

  String _getToolbarTitle() {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    if (_activeView == 'month') {
      return '${months[_currentDate.month - 1]} ${_currentDate.year}';
    } else if (_activeView == 'week') {
      final startWeek =
          _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
      final endWeek = startWeek.add(const Duration(days: 6));
      return '${startWeek.day} - ${endWeek.day} ${months[_currentDate.month - 1]} ${_currentDate.year}';
    } else {
      return '${_currentDate.day} ${months[_currentDate.month - 1]} ${_currentDate.year}';
    }
  }

  Widget _buildActiveViewWidget() {
    if (_activeView == 'week') {
      return _buildWeekView();
    } else if (_activeView == 'day') {
      return _buildDayView();
    }
    return _buildMonthView();
  }

  // ─────────────────── 1. MONTH VIEW WIDGET ───────────────────
  Widget _buildMonthView() {
    // Days grid builder
    final startOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final daysInMonth =
        DateUtils.getDaysInMonth(_currentDate.year, _currentDate.month);
    final startOffset = startOfMonth.weekday % 7; // Sunday = 0, Monday = 1...

    final totalGridCells = daysInMonth + startOffset;
    final rowsCount = (totalGridCells / 7.0).ceil();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          // Days titles (Sun, Mon...)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: _weekdays
                  .map((w) => Expanded(
                        child: Center(
                          child: CustomText(w,
                              fontSize: 13,
                              fontWeight: FW.bold,
                              color: Colors.grey.shade600),
                        ),
                      ))
                  .toList(),
            ),
          ),

          // Days Grid
          Column(
            children: List.generate(rowsCount, (rowIndex) {
              return Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade100,
                            width: rowIndex == rowsCount - 1 ? 0 : 1))),
                child: Row(
                  children: List.generate(7, (colIndex) {
                    final cellIndex = rowIndex * 7 + colIndex;
                    final dayNum = cellIndex - startOffset + 1;
                    final isValidDay = dayNum > 0 && dayNum <= daysInMonth;

                    return Expanded(
                      child: Container(
                        height: 100.toH(),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Colors.grey.shade100,
                                    width: colIndex == 6 ? 0 : 1))),
                        padding: const EdgeInsets.all(6),
                        child: isValidDay
                            ? _buildMonthDayCell(dayNum)
                            : const SizedBox(),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthDayCell(int dayNum) {
    final dayDate = DateTime(_currentDate.year, _currentDate.month, dayNum);
    final formattedDate =
        '${dayDate.year}-${dayDate.month.toString().padLeft(2, '0')}-${dayDate.day.toString().padLeft(2, '0')}';

    // Get appointments on this date
    final dayAppointments = controller.appointments
        .where((element) => element.date == formattedDate)
        .toList();
    final isToday =
        dayNum == 17 && _currentDate.month == 5; // Highlight May 17 as today

    return Wrap(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isToday ? AppColors.get.primary : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: CustomText(
            '$dayNum',
            fontSize: 12,
            fontWeight: FW.bold,
            color: isToday ? Colors.white : AppColors.get.textPrimary,
          ),
        ),
        // const Spacer(),
        if (dayAppointments.isNotEmpty)
          Wrap(
            spacing: 2,
            runSpacing: 4,
            children: dayAppointments.take(2).map((appt) {
              return GestureDetector(
                onTap: () => _showAppointmentActions(appt),
                child: Container(
                  width: 40,
                  height: 30,
                  margin: const EdgeInsets.only(bottom: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: appt.statusColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: appt.statusColor.withOpacity(0.2),
                    ),
                  ),
                  child: CustomText(
                    ExtractString.getInitials(appt.patientName),
                    fontSize: 10,
                    fontWeight: FW.bold,
                    color: appt.statusColor,
                    maxLines: 1,
                    isOverFlow: true,
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  // ─────────────────── 2. WEEK VIEW WIDGET ───────────────────
  Widget _buildWeekView() {
    final startOfWeek =
        _currentDate.subtract(Duration(days: _currentDate.weekday % 7));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: Row(
              children: List.generate(7, (index) {
                final day = startOfWeek.add(Duration(days: index));
                return Expanded(
                  child: Column(
                    children: [
                      CustomText(_weekdays[index],
                          fontSize: 11,
                          fontWeight: FW.bold,
                          color: Colors.grey),
                      4.ESH(),
                      CustomText('${day.day}',
                          fontSize: 14,
                          fontWeight: FW.bold,
                          color: AppColors.get.textPrimary),
                    ],
                  ),
                );
              }),
            ),
          ),

          // Body Columns
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(7, (colIdx) {
              final colDay = startOfWeek.add(Duration(days: colIdx));
              final formattedStr =
                  '${colDay.year}-${colDay.month.toString().padLeft(2, '0')}-${colDay.day.toString().padLeft(2, '0')}';
              final appts = controller.appointments
                  .where((element) => element.date == formattedStr)
                  .toList();

              return Expanded(
                child: Container(
                  height: 400.toH(),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: Colors.grey.shade100,
                            width: colIdx == 6 ? 0 : 1)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  child: SingleChildScrollView(
                    child: Column(
                      children: appts.map((appt) {
                        return _buildCompactCard(appt);
                      }).toList(),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactCard(Appointment appt) {
    return GestureDetector(
      onTap: () => _showAppointmentActions(appt),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: appt.statusColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appt.statusColor.withOpacity(0.18)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(appt.time,
                fontSize: 10, fontWeight: FW.bold, color: appt.statusColor),
            4.ESH(),
            CustomText(appt.patientName,
                fontSize: 11.5,
                fontWeight: FW.bold,
                color: AppColors.get.textPrimary),
            2.ESH(),
            CustomText(appt.doctorName.split(' ').last,
                fontSize: 10, color: AppColors.get.textSecondary),
          ],
        ),
      ),
    );
  }

  // ─────────────────── 3. DAY VIEW WIDGET ───────────────────
  Widget _buildDayView() {
    final dateStr =
        '${_currentDate.year}-${_currentDate.month.toString().padLeft(2, '0')}-${_currentDate.day.toString().padLeft(2, '0')}';
    final dayAppointments = controller.appointments
        .where((element) => element.date == dateStr)
        .toList();

    final hours = [
      '09:00 AM',
      '10:00 AM',
      '11:00 AM',
      '12:00 PM',
      '01:00 PM',
      '02:00 PM',
      '03:00 PM',
      '04:00 PM',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade200))),
            child: Row(
              children: [
                Icon(Icons.calendar_view_day_rounded,
                    color: AppColors.get.primary),
                12.ESW(),
                CustomText(
                    'Agenda for selected date (${dayAppointments.length} slots booked)',
                    fontSize: 13.5,
                    fontWeight: FW.bold),
              ],
            ),
          ),
          ...hours.map((hour) {
            final appt = dayAppointments.firstWhere(
              (element) => element.time.contains(hour.substring(0, 2)),
              orElse: () => Appointment(
                  id: -1,
                  patientName: '',
                  initials: '',
                  time: '',
                  date: '',
                  doctorName: '',
                  visitType: '',
                  status: '',
                  statusColor: Colors.transparent),
            );

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                children: [
                  SizedBox(
                    width: 90.toW(),
                    child: CustomText(
                      hour,
                      fontSize: 12.5,
                      fontWeight: FW.bold,
                      color: Colors.grey,
                    ),
                  ),
                  20.ESW(),
                  Expanded(
                    child: appt.id != -1
                        ? _buildDetailedCard(appt)
                        : _buildEmptyHourSlot(hour),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailedCard(Appointment appt) {
    return GestureDetector(
      onTap: () => _showAppointmentActions(appt),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: appt.statusColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appt.statusColor.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: appt.statusColor.withOpacity(0.2),
              child: CustomText(appt.initials,
                  fontSize: 12, fontWeight: FW.bold, color: appt.statusColor),
            ),
            16.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(appt.patientName,
                      fontSize: 13, fontWeight: FW.bold),
                  4.ESH(),
                  CustomText('Doctor: ${appt.doctorName}',
                      fontSize: 11.5, color: AppColors.get.textSecondary),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: appt.statusColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(appt.status,
                  fontSize: 11.5, fontWeight: FW.bold, color: appt.statusColor),
            ),
            20.ESW(),
            Icon(Icons.more_vert_rounded, color: appt.statusColor),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyHourSlot(String hour) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          const Icon(Icons.add_circle_outline_rounded,
              color: Colors.grey, size: 16),
          8.ESW(),
          const CustomText('No consultations booked. Click to reserve.',
              fontSize: 11.5, color: Colors.grey),
        ],
      ),
    );
  }

  // ─────────────────── ACTIONS MODAL POPUP ───────────────────
  void _showAppointmentActions(Appointment appt) {
    AppDialogs.showDialog(
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: appt.statusColor.withOpacity(0.12),
              child: CustomText(appt.initials,
                  fontSize: 11, fontWeight: FW.bold, color: appt.statusColor),
            ),
            12.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(appt.patientName,
                      fontSize: 14, fontWeight: FW.bold),
                  4.ESH(),
                  CustomText('With ${appt.doctorName} at ${appt.time}',
                      fontSize: 11.5, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
        children: [
          const Divider(),
          _buildActionItem(Icons.edit_calendar_rounded,
              'Reschedule Appointment', AppColors.get.primary, () {
            Get.back();
            context.go('/appointments/edit/${appt.id}');
          }),
          _buildActionItem(Icons.check_circle_outline_rounded,
              'Mark as Completed', Colors.green, () {
            Get.back();
            controller.completeAppointment(appt.id);
          }),
          _buildActionItem(Icons.cancel_outlined, 'Cancel Slot', Colors.red,
              () {
            Get.back();
            controller.cancelAppointment(appt.id);
          }),
          _buildActionItem(Icons.delete_outline_rounded, 'Remove Permanently',
              Colors.grey.shade700, () {
            Get.back();
            controller.deleteAppointment(appt.id);
          }),
        ],
      ),
    );
  }

  Widget _buildActionItem(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return SimpleDialogOption(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          16.ESW(),
          CustomText(label, fontSize: 13, fontWeight: FW.bold, color: color),
        ],
      ),
    );
  }

  // ─────────────────── RIGHT SIDEBAR WIDGETS ───────────────────
  Widget _buildRightSidebar() {
    return Container(
      padding: EdgeInsets.all(20.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.015),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Icon(Icons.insights_rounded, color: Colors.teal),
              10.ESW(),
              CustomText('Specialist Insights',
                  fontSize: 14, fontWeight: FW.bold),
            ],
          ),
          20.ESH(),

          // Stats Rows
          _buildInsightStatCard(
              'Total Scheduled',
              '${controller.appointments.length}',
              Colors.teal.shade50,
              Colors.teal),
          12.ESH(),
          _buildInsightStatCard(
              'Confirmed Slots',
              '${controller.appointments.where((element) => element.status == 'Confirmed').length}',
              Colors.blue.shade50,
              Colors.blue),
          12.ESH(),
          _buildInsightStatCard(
              'Completed Vis.',
              '${controller.appointments.where((element) => element.status == 'Completed').length}',
              Colors.green.shade50,
              Colors.green),

          24.ESH(),
          const Divider(),
          24.ESH(),

          // Doctor schedules status
          const CustomText('Physician Availability Today',
              fontSize: 13, fontWeight: FW.bold),
          12.ESH(),
          _buildDoctorAvailabilityRow('Dr. Sarah Bennett',
              '08:00 AM - 04:00 PM', 'Active', Colors.green),
          10.ESH(),
          _buildDoctorAvailabilityRow(
              'Dr. Robert Fox', '10:00 AM - 02:00 PM', 'On Call', Colors.blue),
          10.ESH(),
          _buildDoctorAvailabilityRow(
              'Dr. John Doe', '01:00 PM - 05:00 PM', 'Active', Colors.green),
        ],
      ),
    );
  }

  Widget _buildInsightStatCard(
      String label, String value, Color bgColor, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeColor.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(label,
              fontSize: 12, fontWeight: FW.bold, color: Colors.grey.shade700),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(8)),
            child: CustomText(value,
                fontSize: 12, fontWeight: FW.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorAvailabilityRow(
      String name, String timing, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(name, fontSize: 12, fontWeight: FW.bold),
              const Spacer(),
              Container(
                width: 7,
                height: 7,
                decoration:
                    BoxDecoration(color: statusColor, shape: BoxShape.circle),
              ),
              6.ESW(),
              CustomText(status,
                  fontSize: 10, fontWeight: FW.bold, color: statusColor),
            ],
          ),
          4.ESH(),
          CustomText(timing, fontSize: 11, color: Colors.grey),
        ],
      ),
    );
  }
}
