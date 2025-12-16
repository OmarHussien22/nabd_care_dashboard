import 'package:care_desk/src/Core/Errors/failures.dart';
import 'package:care_desk/src/Features/Clinic/data/datasources/clinic_local_datasource.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/booking.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/doctor.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/patient.dart';
import 'package:care_desk/src/Features/Clinic/domain/repositories/clinic_repository.dart';
import 'package:dartz/dartz.dart';

class ClinicRepositoryImpl implements ClinicRepository {
  final ClinicLocalDataSource dataSource;

  ClinicRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, int>> addDoctor(Doctor doctor) async {
    try {
      final result = await dataSource.addDoctor(doctor);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Doctor>>> getDoctors() async {
    try {
      final result = await dataSource.getDoctors();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addPatient(Patient patient) async {
    try {
      final result = await dataSource.addPatient(patient);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Patient>>> getPatients() async {
    try {
      final result = await dataSource.getPatients();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addBooking(Booking booking) async {
    try {
      final result = await dataSource.addBooking(booking);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Booking>>> getBookings() async {
    try {
      final result = await dataSource.getBookings();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
