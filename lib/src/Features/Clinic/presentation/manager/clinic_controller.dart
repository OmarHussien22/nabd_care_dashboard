import 'package:care_desk/src/Features/Clinic/data/datasources/clinic_local_datasource.dart';
import 'package:care_desk/src/Features/Clinic/data/repositories/clinic_repository_impl.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/booking.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/doctor.dart';
import 'package:care_desk/src/Features/Clinic/domain/entities/patient.dart';
import 'package:care_desk/src/Features/Clinic/domain/use_cases/clinic_use_cases.dart';
import 'package:get/get.dart';

class ClinicController extends GetxController {
  final AddDoctorUseCase addDoctorUseCase;
  final GetDoctorsUseCase getDoctorsUseCase;
  final AddPatientUseCase addPatientUseCase;
  final GetPatientsUseCase getPatientsUseCase;
  final AddBookingUseCase addBookingUseCase;
  final GetBookingsUseCase getBookingsUseCase;

  ClinicController({
    required this.addDoctorUseCase,
    required this.getDoctorsUseCase,
    required this.addPatientUseCase,
    required this.getPatientsUseCase,
    required this.addBookingUseCase,
    required this.getBookingsUseCase,
  });

  // Dependency Injection helper
  static ClinicController get init {
    final dataSource = ClinicLocalDataSourceImpl();
    final repo = ClinicRepositoryImpl(dataSource);
    return Get.put(ClinicController(
      addDoctorUseCase: AddDoctorUseCase(repo),
      getDoctorsUseCase: GetDoctorsUseCase(repo),
      addPatientUseCase: AddPatientUseCase(repo),
      getPatientsUseCase: GetPatientsUseCase(repo),
      addBookingUseCase: AddBookingUseCase(repo),
      getBookingsUseCase: GetBookingsUseCase(repo),
    ));
  }

  // State
  var doctors = <Doctor>[].obs;
  var patients = <Patient>[].obs;
  var bookings = <Booking>[].obs;
  
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    loadAllData();
  }

  Future<void> loadAllData() async {
    isLoading.value = true;
    await Future.wait([
      getDoctors(),
      getPatients(),
      getBookings(),
    ]);
    isLoading.value = false;
  }

  Future<void> addDoctor(Doctor doctor) async {
    final result = await addDoctorUseCase(doctor);
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (id) => getDoctors(),
    );
  }

  Future<void> getDoctors() async {
    final result = await getDoctorsUseCase();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (data) => doctors.assignAll(data),
    );
  }

  Future<void> addPatient(Patient patient) async {
    final result = await addPatientUseCase(patient);
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (id) => getPatients(),
    );
  }

  Future<void> getPatients() async {
    final result = await getPatientsUseCase();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (data) => patients.assignAll(data),
    );
  }

  Future<void> addBooking(Booking booking) async {
    final result = await addBookingUseCase(booking);
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (id) => getBookings(),
    );
  }

  Future<void> getBookings() async {
    final result = await getBookingsUseCase();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (data) => bookings.assignAll(data),
    );
  }
}
