import 'package:care_desk/src/Core/network_structure/exceptions/failure.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/booking.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/doctor.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/patient.dart';
import 'package:care_desk/src/Features/Clinic/domain/repositories/clinic_repository.dart';
import 'package:dartz/dartz.dart';




class AddDoctorUseCase {
  final ClinicRepository repository;
  AddDoctorUseCase(this.repository);
  Future<Either<Failure, int>> call(Doctor doctor) => repository.addDoctor(doctor);
}

class GetDoctorsUseCase {
  final ClinicRepository repository;
  GetDoctorsUseCase(this.repository);
  Future<Either<Failure, List<Doctor>>> call() => repository.getDoctors();
}

class AddPatientUseCase {
  final ClinicRepository repository;
  AddPatientUseCase(this.repository);
  Future<Either<Failure, int>> call(Patient patient) => repository.addPatient(patient);
}

class GetPatientsUseCase {
  final ClinicRepository repository;
  GetPatientsUseCase(this.repository);
  Future<Either<Failure, List<Patient>>> call() => repository.getPatients();
}

class AddBookingUseCase {
  final ClinicRepository repository;
  AddBookingUseCase(this.repository);
  Future<Either<Failure, int>> call(Booking booking) => repository.addBooking(booking);
}

class GetBookingsUseCase {
  final ClinicRepository repository;
  GetBookingsUseCase(this.repository);
  Future<Either<Failure, List<Booking>>> call() => repository.getBookings();
}
