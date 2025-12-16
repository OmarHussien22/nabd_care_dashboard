import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/tables/clinic_tables.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/booking.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/doctor.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/patient.dart';

abstract class ClinicLocalDataSource {
  Future<int> addDoctor(Doctor doctor);
  Future<List<Doctor>> getDoctors();
  
  Future<int> addPatient(Patient patient);
  Future<List<Patient>> getPatients();
  
  Future<int> addBooking(Booking booking);
  Future<List<Booking>> getBookings();
}

class ClinicLocalDataSourceImpl implements ClinicLocalDataSource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<int> addDoctor(Doctor doctor) async {
    final db = await dbHelper.database;
    return await db.insert(ClinicTables.doctorsTable, doctor.toJson());
  }

  @override
  Future<List<Doctor>> getDoctors() async {
    final db = await dbHelper.database;
    final result = await db.query(ClinicTables.doctorsTable);
    return result.map((e) => Doctor.fromJson(e)).toList();
  }

  @override
  Future<int> addPatient(Patient patient) async {
    final db = await dbHelper.database;
    return await db.insert(ClinicTables.patientsTable, patient.toJson());
  }

  @override
  Future<List<Patient>> getPatients() async {
    final db = await dbHelper.database;
    final result = await db.query(ClinicTables.patientsTable);
    return result.map((e) => Patient.fromJson(e)).toList();
  }

  @override
  Future<int> addBooking(Booking booking) async {
    final db = await dbHelper.database;
    return await db.insert(ClinicTables.bookingsTable, booking.toJson());
  }

  @override
  Future<List<Booking>> getBookings() async {
    final db = await dbHelper.database;
    final result = await db.query(ClinicTables.bookingsTable);
    return result.map((e) => Booking.fromJson(e)).toList();
  }
}
