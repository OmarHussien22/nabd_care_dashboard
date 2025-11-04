import 'package:getx_base_code/src/Core/Styles/Colors/Interface/color_interface.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/Parts/imports_colors.dart';

class AppColors {
  AppColors._();
  static ColorInterface get = LightColor();
  static void changeColor({required bool isDark, required Function update}) {
    get = isDark ? DarkColor() : LightColor();
    update();
  }
}
