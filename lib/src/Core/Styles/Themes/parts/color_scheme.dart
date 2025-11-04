part of 'imports_parts.dart';

class GetColorScheme {
  GetColorScheme._();

  static ColorScheme get light {
    return ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.get.primary,
      secondary: AppColors.get.secondary,
      surface: AppColors.get.cardFill,
      error: AppColors.get.error,
      primaryContainer: AppColors.get.main,
      errorContainer: AppColors.get.error.withOpacity(0.4),
      shadow: AppColors.get.shadow,
    );
  }

  static ColorScheme get dark {
    return ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.get.primary,
      secondary: AppColors.get.secondary,
      surface: AppColors.get.cardFill,
      error: AppColors.get.error,
      primaryContainer: AppColors.get.main,
      errorContainer: AppColors.get.error.withOpacity(0.4),
      shadow: AppColors.get.shadow,
    );
  }
}
