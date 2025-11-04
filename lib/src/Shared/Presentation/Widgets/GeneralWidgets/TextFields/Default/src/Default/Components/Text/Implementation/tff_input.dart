part of 'imports_text.dart';

class TFFInput extends TFFTextImp {
  const TFFInput({
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
      color: color ?? TFFConstants.color.tFFInputTitle,
      fontWeight: fontWeight ?? TFFConstants.headerFontWeight,
      fontSize: (fontSize ?? TFFConstants.inputFontSize).toFS(),
      backgroundColor: backgroundColor ?? TFFConstants.color.tFFInputBackground,
      fontFamily: fontFamily ?? AppStrings.fontFamily,
    );
  }
}
