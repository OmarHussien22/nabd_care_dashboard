import 'package:flutter/material.dart';

class SideBarItemEntity {
  final String label;
  final IconData icon;
  final String route;

  SideBarItemEntity({
    required this.label,
    required this.icon,
    required this.route,
  });

  static List<SideBarItemEntity> get defaultItems => [
        SideBarItemEntity(
          label: 'Dashboard',
          icon: Icons.dashboard_outlined,
          route: '/dashboard',
        ),
        SideBarItemEntity(
          label: 'Patients',
          icon: Icons.people_outline,
          route: '/patients',
        ),
        SideBarItemEntity(
          label: 'Appointments',
          icon: Icons.calendar_today_outlined,
          route: '/appointments',
        ),
        SideBarItemEntity(
          label: 'Users',
          icon: Icons.person_search_outlined,
          route: '/users',
        ),
        SideBarItemEntity(
          label: 'Roles',
          icon: Icons.security_outlined,
          route: '/roles',
        ),
        SideBarItemEntity(
          label: 'Settings',
          icon: Icons.settings_outlined,
          route: '/settings',
        ),
      ];

}