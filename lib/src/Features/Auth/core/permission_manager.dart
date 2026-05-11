import '../presentation/manger/auth_controller.dart';

class PermissionManager {
  PermissionManager._();
  static final instance = PermissionManager._();

  bool hasPermission(String permissionId) {
    final user = AuthController.instance.user;
    if (user == null) return false;
    
    // Admin check placeholder
    if (user.userType == 'admin') return true;

    // TODO: Implement actual permission check logic from user.roles/permissions
    return true; 
  }

  // Patients
  bool canViewPatients() => hasPermission('patients.view');
  bool canCreatePatient() => hasPermission('patients.create');
  bool canEditPatient() => hasPermission('patients.edit');
  bool canDeletePatient() => hasPermission('patients.delete');

  // Appointments
  bool canViewAppointments() => hasPermission('appointments.view');
  bool canCreateAppointment() => hasPermission('appointments.create');
  bool canDeleteAppointment() => hasPermission('appointments.delete');

  // Billing
  bool canEditInvoice() => hasPermission('billing.edit');
  bool canViewBilling() => hasPermission('billing.view');
}
