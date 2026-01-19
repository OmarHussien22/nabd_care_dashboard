import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/App/app_initializer.dart';

import 'src/my_app.dart';

// end background
void main() async {
  await AppInitializer.initializeApp();

  runApp(const MyApp());
}
