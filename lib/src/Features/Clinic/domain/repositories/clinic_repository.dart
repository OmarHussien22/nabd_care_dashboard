import 'package:care_desk/src/Features/Clinic/domain/entities/booking.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/doctor.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/patient.dart';
import 'package:dartz/dartz.dart';
import 'package:care_desk/src/Core/Errors/failures.dart';

abstract class ClinicRepository {
  Future<Either<Failure, int>> addDoctor(Doctor doctor);
  Future<Either<Failure, List<Doctor>>> getDoctors();
  
  Future<Either<Failure, int>> addPatient(Patient patient);
  Future<Either<Failure, List<Patient>>> getPatients();
  
  Future<Either<Failure, int>> addBooking(Booking booking);
  Future<Either<Failure, List<Booking>>> getBookings();
}
