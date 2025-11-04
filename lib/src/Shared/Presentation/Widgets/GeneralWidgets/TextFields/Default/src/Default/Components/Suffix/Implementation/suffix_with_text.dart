part of 'imports_suffix.dart';

class SuffixWithText extends SuffixImp {
  SuffixWithText({
    required String title,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    double? fontSize,

  }) : super(
          title: title,
          fontSize: (fontSize??TFFConstants.suffixFontSize).toFS(),
          color: color ?? TFFConstants.color.tFFSuffixText,
          fontWeight: fontWeight??TFFConstants.suffixFontWeight,
        );
}
