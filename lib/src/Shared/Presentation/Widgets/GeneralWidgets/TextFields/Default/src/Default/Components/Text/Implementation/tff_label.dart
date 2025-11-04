part of 'imports_text.dart';

class TFFLabel extends TFFTextImp {
  const TFFLabel({
    super.title,
    super.color,
    super.fontWeight,
    super.fontSize,
    super.backgroundColor,
    super.fontFamily,
  });

  @override
  TextStyle? get getTextStyle {
    return TextStyle(
      color: color ?? TFFConstants.color.tFFLabelTitle,
      fontWeight: fontWeight ?? TFFConstants.headerFontWeight,
      fontSize: (fontSize ?? TFFConstants.headerFontSize).toFS(),
      backgroundColor: backgroundColor ?? TFFConstants.color.tFFLabelBackground,
      fontFamily: fontFamily ?? AppStrings.fontFamily,
    );
  }
}
