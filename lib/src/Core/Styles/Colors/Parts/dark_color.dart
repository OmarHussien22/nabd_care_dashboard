part of 'imports_colors.dart';

class DarkColor extends ColorInterface {
  @override
  Color get main => const Color(0xff05103C);

  @override
  Color get background => const Color(0xff05103C);

  @override
  Color get activeBackground => const Color(0xe2061349);

  @override
  Color get disabled => const Color(0xff101C43);

  @override
  Color get title => Colors.white;

  @override
  Color get tFFFillColor => const Color(0xff101C43);

  @override
  Color get shadow => const Color(0xff040E35);

  @override
  Color get cardBorder => const Color(0xff101C43);

  @override
  Color get tabBar => main;

  @override
  Color get cardFill => Colors.white12.withOpacity(0.05);

  @override
  Color get icon => Colors.white;

  @override
  Color get opposite => Colors.white;

  @override
  Color get onRefreshIndicator => primary.withOpacity(0.8);

  @override
  Color get appBarColorInner => Colors.white;
}
