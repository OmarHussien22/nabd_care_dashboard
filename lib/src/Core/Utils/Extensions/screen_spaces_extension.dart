import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSpaces on num {
  // ignore: non_constant_identifier_names
  /// Sized Box with Width
  SizedBox ESW() => SizedBox(
        width: w,
      );

  /// Sized Box with height
  // ignore: non_constant_identifier_names
  SizedBox ESH() =>  SizedBox(
      height: h,
    );


  /// radius
  // ignore: non_constant_identifier_names
  double toRad() => (r);

  /// font size
  // ignore: non_constant_identifier_names
  double toFS() => (sp);

  /// height
  double toH() => (h);

  /// width
  double toW() => (w);
}
