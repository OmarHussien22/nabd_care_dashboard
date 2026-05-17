import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appointment {
  final int id;
  final String patientName;
  final String initials;
  final String time;
  final String date;
  final String doctorName;
  final String visitType;
  final String status;
  final Color statusColor;

  Appointment({
    required this.id,
    required this.patientName,
    required this.initials,
    required this.time,
    required this.date,
    required this.doctorName,
    required this.visitType,
    required this.status,
    required this.statusColor,
  });

  Appointment copyWith({
    int? id,
    String? patientName,
    String? initials,
    String? time,
    String? date,
    String? doctorName,
    String? visitType,
    String? status,
    Color? statusColor,
  }) {
    return Appointment(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      initials: initials ?? this.initials,
      time: time ?? this.time,
      date: date ?? this.date,
      doctorName: doctorName ?? this.doctorName,
      visitType: visitType ?? this.visitType,
      status: status ?? this.status,
      statusColor: statusColor ?? this.statusColor,
    );
  }
}

class AppointmentsController extends GetxController {
  var appointments = <Appointment>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _seedDefaultAppointments();
  }

  void _seedDefaultAppointments() {
    appointments.assignAll([
      Appointment(
        id: 1,
        patientName: 'Ahmed Ali',
        initials: 'AA',
        time: '09:00 AM',
        date: '2026-05-17',
        doctorName: 'Dr. Sarah Bennett',
        visitType: 'Consultation',
        status: 'Confirmed',
        statusColor: Colors.blue,
      ),
      Appointment(
        id: 2,
        patientName: 'Sarah Jane',
        initials: 'SJ',
        time: '10:30 AM',
        date: '2026-05-17',
        doctorName: 'Dr. Sarah Bennett',
        visitType: 'Follow-up',
        status: 'Completed',
        statusColor: Colors.green,
      ),
      Appointment(
        id: 3,
        patientName: 'Michael Ross',
        initials: 'MR',
        time: '11:15 AM',
        date: '2026-05-18',
        doctorName: 'Dr. Robert Fox',
        visitType: 'Emergency',
        status: 'Pending',
        statusColor: Colors.orange,
      ),
      Appointment(
        id: 4,
        patientName: 'Emma Wilson',
        initials: 'EW',
        time: '02:00 PM',
        date: '2026-05-19',
        doctorName: 'Dr. Sarah Bennett',
        visitType: 'Check-up',
        status: 'Cancelled',
        statusColor: Colors.red,
      ),
    ]);
  }

  // ─────────────────── ADD APPOINTMENT ───────────────────
  Future<bool> createAppointment({
    required String patientName,
    required String doctorName,
    required String time,
    required String date,
    required String visitType,
  }) async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 600)); // Smooth UX transition

    final initials = patientName.trim().isEmpty
        ? '?'
        : patientName.trim().split(' ').map((e) => e.isEmpty ? '' : e[0]).take(2).join().toUpperCase();

    final newAppt = Appointment(
      id: appointments.isEmpty ? 1 : appointments.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1,
      patientName: patientName,
      initials: initials,
      time: time,
      date: date,
      doctorName: doctorName,
      visitType: visitType,
      status: 'Confirmed',
      statusColor: Colors.blue,
    );

    appointments.add(newAppt);
    isLoading.value = false;
    update();

    Get.snackbar(
      '✓ Success',
      'Appointment successfully scheduled for $patientName',
      backgroundColor: const Color(0xFF22C55E),
      colorText: Colors.white,
    );
    return true;
  }

  // ─────────────────── RESCHEDULE / UPDATE ───────────────────
  Future<bool> editAppointment({
    required int id,
    required String time,
    required String date,
    required String doctorName,
    required String visitType,
    required String status,
  }) async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 500));

    final idx = appointments.indexWhere((element) => element.id == id);
    if (idx != -1) {
      Color color = Colors.orange;
      if (status == 'Confirmed') color = Colors.blue;
      if (status == 'Completed') color = Colors.green;
      if (status == 'Cancelled') color = Colors.red;

      appointments[idx] = appointments[idx].copyWith(
        time: time,
        date: date,
        doctorName: doctorName,
        visitType: visitType,
        status: status,
        statusColor: color,
      );
      isLoading.value = false;
      update();

      Get.snackbar(
        '✓ Success',
        'Appointment rescheduled successfully',
        backgroundColor: const Color(0xFF22C55E),
        colorText: Colors.white,
      );
      return true;
    }
    isLoading.value = false;
    update();
    return false;
  }

  // ─────────────────── MARK AS COMPLETED ───────────────────
  void completeAppointment(int id) {
    final idx = appointments.indexWhere((element) => element.id == id);
    if (idx != -1) {
      appointments[idx] = appointments[idx].copyWith(
        status: 'Completed',
        statusColor: Colors.green,
      );
      update();
      Get.snackbar('Status Changed', 'Appointment marked as completed.');
    }
  }

  // ─────────────────── CANCEL APPOINTMENT ───────────────────
  void cancelAppointment(int id) {
    final idx = appointments.indexWhere((element) => element.id == id);
    if (idx != -1) {
      appointments[idx] = appointments[idx].copyWith(
        status: 'Cancelled',
        statusColor: Colors.red,
      );
      update();
      Get.snackbar('Cancelled', 'Appointment cancelled successfully.', backgroundColor: Colors.red.shade100);
    }
  }

  // ─────────────────── DELETE APPOINTMENT ───────────────────
  Future<void> deleteAppointment(int id) async {
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Text('Remove Appointment'),
          ],
        ),
        content: const Text('Are you sure you want to permanently remove this appointment from logs?'),
        actions: [
          TextButton(onPressed: () => Get.back(result: false), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Remove'),
          )
        ],
      ),
    );

    if (confirmed == true) {
      appointments.removeWhere((element) => element.id == id);
      update();
      Get.snackbar('Removed', 'Appointment log entry permanently deleted.');
    }
  }
}
