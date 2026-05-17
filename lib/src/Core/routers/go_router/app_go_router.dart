import 'package:care_desk/src/Core/routers/app_route_observer.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:care_desk/src/Features/Auth/presentation/manger/auth_controller.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/pages/dashboard_page.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_page.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointment_form_page.dart';
import 'package:care_desk/src/Features/Appointments/presentation/pages/appointments_calendar_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patients_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patient_form_page.dart';
import 'package:care_desk/src/Features/Patients/presentation/pages/patient_details_page.dart';
import 'package:care_desk/src/Features/Users/presentation/pages/users_list_page.dart';
import 'package:care_desk/src/Features/Users/presentation/pages/user_form_page.dart';
import 'package:care_desk/src/Features/Roles/presentation/pages/roles_list_page.dart';
import 'package:care_desk/src/Features/Roles/presentation/pages/role_form_page.dart';
import 'package:care_desk/src/Features/Profile/presentation/pages/profile_page.dart';
import 'package:care_desk/src/Features/Settings/presentation/pages/settings_page.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/pages/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
  AppGoRouter._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/login',
    observers: [AppRouteObserver()],
    redirect: (context, state) {
      final authController = AuthController.instance;
      final isAuthenticated = authController.isAuthenticated;
      final location = state.matchedLocation;

      final bool isAuthRoute = location == '/login' ||
          location == '/register' ||
          location == '/forget-password' ||
          location == '/reset-password';

      if (!isAuthenticated) {
        return isAuthRoute ? null : '/login';
      }

      if (isAuthRoute) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forget-password',
        name: 'forget-password',
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: '/reset-password',
        name: 'reset-password',
        builder: (context, state) {
          final phone = state.uri.queryParameters['phone'] ?? '';
          return ResetPasswordPage(phone: phone);
        },
      ),
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/patients',
            name: 'patients',
            builder: (context, state) => const PatientsPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create-patient',
                builder: (context, state) => const PatientFormPage(isEdit: false),
              ),
              GoRoute(
                path: 'edit/:id',
                name: 'edit-patient',
                builder: (context, state) => const PatientFormPage(isEdit: true),
              ),
              GoRoute(
                path: 'details/:id',
                name: 'patient-details',
                builder: (context, state) {
                  final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                  return PatientDetailsPage(patientId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/appointments',
            name: 'appointments',
            builder: (context, state) => const AppointmentsPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create-appointment',
                builder: (context, state) => const AppointmentFormPage(isEdit: false),
              ),
              GoRoute(
                path: 'edit/:id',
                name: 'edit-appointment',
                builder: (context, state) {
                  final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                  return AppointmentFormPage(isEdit: true, appointmentId: id);
                },
              ),
              GoRoute(
                path: 'calendar',
                name: 'appointments-calendar',
                builder: (context, state) => const AppointmentsCalendarPage(),
              ),
            ],
          ),
          GoRoute(
            path: '/users',
            name: 'users',
            builder: (context, state) => const UsersListPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create-user',
                builder: (context, state) => const UserFormPage(isEdit: false),
              ),
              GoRoute(
                path: 'edit/:id',
                name: 'edit-user',
                builder: (context, state) => const UserFormPage(isEdit: true),
              ),
            ],
          ),
          GoRoute(
            path: '/roles',
            name: 'roles',
            builder: (context, state) => const RolesListPage(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create-role',
                builder: (context, state) => const RoleFormPage(isEdit: false),
              ),
              GoRoute(
                path: 'edit/:id',
                name: 'edit-role',
                builder: (context, state) => const RoleFormPage(isEdit: true),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('Page not found')),
      );
    },
  );

  static void push(String location, {Object? extra}) {
    router.push(location, extra: extra);
  }

  static void replace(String location, {Object? extra}) {
    router.pushReplacement(location, extra: extra);
  }

  static void go(String location, {Object? extra}) {
    router.go(location, extra: extra);
  }

  static void pop<T extends Object?>([T? result]) {
    if (router.canPop()) {
      router.pop(result);
    }
  }
}
