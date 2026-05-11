part of 'app_router_imports.dart';

class AppRoutes {
  AppRoutes._private();

  /// auth
  static const login = "/login";
  static const register = "/register";

  /// root and dashboard shell
  static const mainApp = "/";
  static const dashboard = "/dashboard";

  /// dashboard children
  static const dashboardHome = "/home";
  static const appointments = "/appointments";
  static const addAppointment = "/appointments/add";
  static const users = "/users";
  static const patients = "/patients";
  static const addPatient = "/patients/add_patient";
  // Patient details is served through addPatient route with query `id`.
  static const patientDetails = addPatient;
  static const settings = "/settings";
  static const acts = "/acts";
  static const testAppointments = "/test-appointments";

  /// legacy aliases (keep while migrating old links/usages)
  static const legacyAppointments = "/appointments";
  static const legacyAddAppointment = "/add-appointment";
  static const legacyUsers = "/users";
  static const legacyPatients = "/patients";
  static const legacyAddPatient = "/add-patient";
  static const legacyPatientDetails = "/patient-details";
  static const legacySettings = "/settings";
  static const legacyActs = "/acts";
  static const legacyTestAppointments = "/test-appointments";

  static String patientDetailsPath(int patientId) =>
      '$addPatient?id=$patientId';

  static String patientDetailsQuery(int patientId) =>
      '$addPatient?id=$patientId';
  
}
