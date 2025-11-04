part of 'imports_colors.dart';

class LightColor extends ColorInterface {
  @override
  Color get main => const Color(0xffFFFFFF);

  @override
  Color get background => const Color(0xffFFFFFF);

  @override
  Color get activeBackground => const Color(0xffF8F8FB);

  @override
  Color get disabled => const Color(0xffE6E6E6);

  @override
  Color get title => Colors.black;

  @override
  Color get tFFFillColor => const Color(0xffF1F2F6);

  @override
  Color get shadow => const Color(0xffDDDEE0);

  @override
  Color get cardBorder => const Color(0xffF1F1F1);

  @override
  Color get tabBar => const Color(0xff101C43);

  @override
  Color get cardFill => main;

  // Color get cardFill => Color(0xff101C43);

  @override
  Color get icon => Colors.black;

  @override
  Color get opposite => const Color(0xff05103C);

  @override
  Color get onRefreshIndicator => primary;

  @override
  Color get appBarColorInner => Colors.black87;
}
