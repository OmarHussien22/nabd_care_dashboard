class Booking {
  final int? id;
  final int doctorId;
  final int patientId;
  final DateTime dateTime;
  final String status;
  final String? notes;

  Booking({
    this.id,
    required this.doctorId,
    required this.patientId,
    required this.dateTime,
    this.status = 'pending',
    this.notes,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      dateTime: DateTime.parse(json['date_time']),
      status: json['status'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'patient_id': patientId,
      'date_time': dateTime.toIso8601String(),
      'status': status,
      'notes': notes,
    };
  }
}
