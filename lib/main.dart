import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:care_desk/src/Core/App/app_initializer.dart';

import 'src/my_app.dart';

// end background
void main() async {
  usePathUrlStrategy();
  await AppInitializer.initializeApp();

  runApp(const MyApp());
}
