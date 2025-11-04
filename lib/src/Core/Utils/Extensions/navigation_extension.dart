import 'package:flutter/material.dart';
import 'package:get/get.dart';



extension NavigationExtension on BuildContext {
  void to(
    Widget page, {
    Transition? transition,
  }) =>
       Get.to(() => page, transition: transition);

  // Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return page;
  //     }));

  void toNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) =>
      Get.toNamed(routeName, parameters: parameters);

  void offNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) =>
      // AppNavigation.offNamed(
      //   this,
      //   routeName: routeName,
      //   parameters: parameters,
      // );

      Get.offNamed(
        routeName,
        parameters: parameters,
      );

  void offAllNamed(
    String routeName, {
    Map<String, String>? parameters,
  }) =>
      // AppNavigation.offAllNamed(
      //   this,
      //   routeName: routeName,
      //   parameters: parameters,
      // );
      Get.offAllNamed(
        routeName,
        parameters: parameters,
      );

  void off(
    Widget page, {
    Transition? transition,
  }) =>
      Get.off(() => page, transition: transition);

  // AppNavigation.off(
  //   this,
  //   page: page,
  //   transition: transition,
  // );

  void offAll(
    Widget page, {
    Transition? transition,
  }) =>
      // AppNavigation.offAll(
      //   this,
      //   page: page,
      //   transition: transition,
      // );
      Get.offAll(
        () => page,
        transition: transition,
      );

  void back( ) {
    Get.back();
    // AppNavigation.back(this);
  }
}
// abstract class AppNavigation{
//
// static void to(
//   BuildContext context, {
//   required Widget page,
//   Transition? transition,
// }) {
//   Get.to(() => page, transition: transition);
//   // Navigator.push(context, MaterialPageRoute(
//   //     builder: (context) {
//   //       return page;
//   //     }));
// }

// static void toNamed(
//   BuildContext context, {
//   required String routeName,
//   Map<String, String>? parameters,
// }) {
//   Get.toNamed(routeName, parameters: parameters);
// }

// static void off(
//   BuildContext context, {
//   required Widget page,
//   Transition? transition,
// }) {
//   Get.off(() => page, transition: transition);
// }

// static void offNamed(
//   BuildContext context, {
//   required String routeName,
//   Map<String, String>? parameters,
// }) {
//   Get.offNamed(
//     routeName,
//     parameters: parameters,
//   );
// }

// static void offAll(
//   BuildContext context, {
//   required Widget page,
//   Transition? transition,
// }) {
//   Get.offAll(
//     () => page,
//     transition: transition,
//   );
// }

// static void offAllNamed(
//   BuildContext context, {
//   required String routeName,
//   Map<String, String>? parameters,
// }) {
//   Get.offAllNamed(
//     routeName,
//     parameters: parameters,
//   );
// }

//   static void back(BuildContext context) {
//     Get.back();
//   }
// }