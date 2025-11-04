import 'package:flutter/material.dart';

abstract class SnapInterface {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get key => _navigationKey;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey  = GlobalKey<ScaffoldMessengerState>();
  GlobalKey<ScaffoldMessengerState> get messengerKey => _scaffoldKey;

  BuildContext? get overlayContext {
    BuildContext? overlay;
    key.currentState?.overlay?.context.visitChildElements((element) {
      overlay = element;
    });
    return overlay;
  }


}
