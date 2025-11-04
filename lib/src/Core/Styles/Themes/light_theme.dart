part of 'imports_themes.dart';

final ThemeData _lightTheme = _defaultTheme.copyWith(
  brightness: Brightness.light,
  appBarTheme: getAppBarTheme(isDark: false),
  colorScheme: GetColorScheme.light,
  scaffoldBackgroundColor: AppColors.get.background,
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.get.white,
    unselectedLabelColor: AppColors.get.tabBarlUnselectedLable,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.get.primary,
    ),
  ),
);
