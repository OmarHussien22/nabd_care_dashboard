part of 'imports_prefix.dart';

class PrefixWithText extends PrefixImp {
  PrefixWithText({
    required String title,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    double? fontSize,

  }) : super(
          title: title,
          fontSize: (fontSize ?? TFFConstants.prefixFontSize).toFS(),
          fontWeight: fontWeight ?? TFFConstants.prefixFontWeight,
          color: color ?? AppColors.get.tTFPrefixText,
        );
}
