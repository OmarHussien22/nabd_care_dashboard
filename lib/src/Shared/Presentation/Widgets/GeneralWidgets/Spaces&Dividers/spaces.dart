import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

/// Creates Horizontal Spaces (X-Axis SizedBox)
class XSpace {
  XSpace._();

  /// width : 2.5
  static SizedBox get tiny => SizedBox(
        width: 2.5.toW(),
      );

  /// width : 5.0
  static SizedBox get light => SizedBox(
        width: 5.toW(),
      );

  /// width : 10.0
  static SizedBox get normal => SizedBox(
        width: 10.toW(),
      );

  /// width : 15.0
  static SizedBox get hard => SizedBox(
        width: 15.toW(),
      );

  /// width : 20.0
  static SizedBox get extreme => SizedBox(
        width: 20.toW(),
      );

  /// width : 25.0
  static SizedBox get titan => SizedBox(
        width: 25.toW(),
      );
}

/// Creates Vertical Spaces (Y-Axis SizedBox)
class YSpace {
  YSpace._();

  /// height : 2.5
  static SizedBox get tiny => SizedBox(
        height: 2.5.toH(),
      );

  /// height : 5.0
  static SizedBox get light => SizedBox(
        height: 5.toH(),
      );

  /// height : 10.0
  static SizedBox get normal => SizedBox(
        height: 10.toH(),
      );

  /// height : 15.0
  static SizedBox get hard => SizedBox(
        height: 15.toH(),
      );

  /// height : 20.0
  static SizedBox get extreme => SizedBox(
        height: 20.toH(),
      );

  /// height : 25.0
  static SizedBox get titan => SizedBox(
        height: 25.toH(),
      );
  static SizedBox get erinYeager => SizedBox(
        height: 50.toH(),
      );

  /// creates a Spacer (free space) in the Columns between 2 children
  static Spacer get spacer => const Spacer();
}
