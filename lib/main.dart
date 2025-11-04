import 'package:flutter/material.dart';
import 'package:getx_base_code/src/Core/App/app_initializer.dart';

import 'src/my_app.dart';

// end background
void main() async {
  await AppInitializer.initializeApp();

  runApp(const MyApp());
}
