import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
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
          label: 'dashboard'.toTr(),
          icon: Icons.dashboard_outlined,
          route: '/dashboard',
        ),
        SideBarItemEntity(
          label: 'patients'.toTr(),
          icon: Icons.people_outline,
          route: '/patients',
        ),
        SideBarItemEntity(
          label: 'appointments'.toTr(),
          icon: Icons.calendar_today_outlined,
          route: '/appointments',
        ),
        SideBarItemEntity(
          label: 'users'.toTr(),
          icon: Icons.person_search_outlined,
          route: '/users',
        ),
        SideBarItemEntity(
          label: 'roles'.toTr(),
          icon: Icons.security_outlined,
          route: '/roles',
        ),
        SideBarItemEntity(
          label: 'settings'.toTr(),
          icon: Icons.settings_outlined,
          route: '/settings',
        ),
      ];

}