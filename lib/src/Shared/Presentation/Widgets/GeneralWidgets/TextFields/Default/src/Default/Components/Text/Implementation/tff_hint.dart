part of 'imports_text.dart';

class TFFHint extends TFFTextImp {
  const TFFHint({
    super.title,
    super.color,
    super.fontWeight,
    super.fontSize,
    super.backgroundColor,
  });

  @override
  TextStyle get getTextStyle {
    return TextStyle(
      color: color ?? TFFConstants.color.tFFHintTitle,
      fontWeight: fontWeight ?? TFFConstants.hintFontWeight,
      fontSize: (fontSize ?? TFFConstants.hintFontSize).toFS(),
      backgroundColor: backgroundColor ?? TFFConstants.color.transparent,
      fontFamily: AppStrings.fontFamily,
    );
  }
}
