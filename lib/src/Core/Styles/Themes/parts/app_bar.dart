part of 'imports_parts.dart';


AppBarTheme getAppBarTheme({
  required bool isDark,
}) {
  return AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.get.appBarColorInner,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.get.appBarColorInner,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.get.appbar,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:  isDark ? Brightness.light : Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontFamily: AppStrings.fontFamily,
      color: AppColors.get.appBarColorInner,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    toolbarTextStyle: TextStyle(
      color: AppColors.get.appBarColorInner,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
     centerTitle: true,
    backgroundColor: AppColors.get.appbar,
  );
}
