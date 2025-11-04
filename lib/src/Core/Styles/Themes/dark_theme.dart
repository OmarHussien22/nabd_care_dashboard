part of 'imports_themes.dart';

final ThemeData _darkTheme = _defaultTheme.copyWith(
  brightness: Brightness.dark,
  appBarTheme: getAppBarTheme(isDark: true),
  colorScheme: GetColorScheme.dark,
);
