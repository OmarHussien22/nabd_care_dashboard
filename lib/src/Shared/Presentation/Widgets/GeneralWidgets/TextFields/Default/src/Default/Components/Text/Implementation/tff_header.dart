part of 'imports_text.dart';

class TFFHeader extends TFFTextImp {
  const TFFHeader({
    super.title,
    super.color,
    super.fontWeight,
    super.fontSize,
    super.backgroundColor,
    super.fontFamily,
  });

  @override
  TextStyle get getTextStyle {
    return TextStyle(
      color: color ?? TFFConstants.color.tFFHeaderTitle,
      fontWeight: fontWeight ?? TFFConstants.headerFontWeight,
      fontSize: (fontSize ?? TFFConstants.headerFontSize).toFS(),
      backgroundColor:
          backgroundColor ?? TFFConstants.color.tFFHeaderBackground,
      fontFamily: fontFamily ?? AppStrings.fontFamily,
    );
  }
}
