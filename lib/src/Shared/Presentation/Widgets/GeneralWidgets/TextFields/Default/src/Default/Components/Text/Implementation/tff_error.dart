part of 'imports_text.dart';

class TFFError extends TFFTextImp {
   const TFFError({
    super.title,
    super.color,
    super.fontWeight,
    super.fontSize,
    super.backgroundColor,
     double? constraintsHeight,
     double? constraintsWidth,
  });

  @override
  TextStyle get getTextStyle {
    return TextStyle(
      color: color??TFFConstants.color.tTFErrorText,
      fontWeight: fontWeight??TFFConstants.errorFontWeight,
      fontSize: (fontSize??TFFConstants.errorFontSize).toFS(),
      backgroundColor: backgroundColor??TFFConstants.color.transparent
    );
  }
}
