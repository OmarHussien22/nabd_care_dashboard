import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void toNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) {
    final location = parameters == null || parameters.isEmpty
        ? routeName
        : Uri(path: routeName, queryParameters: parameters).toString();
    NavigationService.instance.push(location);
  }

  void offNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) {
    final location = parameters == null || parameters.isEmpty
        ? routeName
        : Uri(path: routeName, queryParameters: parameters).toString();
    NavigationService.instance.replace(location);
  }

  void offAllNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) {
    final location = parameters == null || parameters.isEmpty
        ? routeName
        : Uri(path: routeName, queryParameters: parameters).toString();
    NavigationService.instance.go(location);
  }

  void back() {
    NavigationService.instance.pop();
  }
}

