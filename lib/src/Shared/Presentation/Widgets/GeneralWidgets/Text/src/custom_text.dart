part of 'imports_text.dart';

class CustomText extends StatelessWidget {
  //<editor-fold desc="Constructor Properties">
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final double? letterSpacing;
  final bool isBold;
  final bool textShadow;
  final bool isUpperCase;
  final EdgeInsetsGeometry? padding;
  final bool isOverFlow;
  final int? maxLines;
  final double? textHeight;
  final CustomTextDecoration decoration;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FW fontWeight;

  const CustomText(
    this.label, {
    super.key,
    this.color,
    this.fontSize = 6,
    this.fontWeight = FW.regular,
    this.isBold = false,
    this.isOverFlow = false,
    this.isUpperCase = false,
    this.padding,
    this.maxLines,
    this.decoration = CustomTextDecoration.none,
    this.textHeight,
    this.fontFamily,
    this.textAlign,
    this.textShadow = false,
    this.backgroundColor,
    this.letterSpacing,
  });

//</editor-fold>
  //<editor-fold desc="Subtitle Text">
  /// Build Subtitle Text
  factory CustomText.subtitle(
    String label, {
    Key? key,
    Color? color,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    double fontSize = 4.0,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
    FW fontWeight = FW.regular,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        backgroundColor: backgroundColor,
        color: color ?? AppColors.get.lightText,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  //</editor-fold>
  //<editor-fold desc="Light Text">

  factory CustomText.light(
    String label, {
    Key? key,
    Color? color,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    double fontSize = 5.0,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
    FW fontWeight = FW.light,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        backgroundColor: backgroundColor,
        color: color ?? AppColors.get.grey,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  //</editor-fold>
  //<editor-fold desc="Header Text">
  /// Build Header Text
  factory CustomText.header(
    String label, {
    Key? key,
    double fontSize = 10.0,
    FW fontWeight = FW.semiBold,
    Color? color,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
  }) =>
      CustomText(
        label,
        decoration: decoration,
        key: key,
        isUpperCase: isUpperCase,
        color: color ?? AppColors.get.primary,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  //</editor-fold>

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        customTextLabel(
          label: label,
          isUpperCase: isUpperCase,
        ),
        textScaleFactor: 1,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              backgroundColor: backgroundColor,
              fontSize: (fontSize ?? 6).toFS(),
              fontWeight: customTextFw(fontWeight),
              decoration: customTextDecoration(decoration),
              //TextDecoration.combine(Decorations),
              height: textHeight,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily ?? AppStrings.fontFamily,
              shadows: textShadow
                  ? [
                      Shadow(
                        blurRadius: 0.8.toRad(),
                        color: Colors.black,
                        offset: const Offset(1, 1),
                      )
                    ]
                  : null,
            ),
        textAlign: textAlign,
        overflow: isOverFlow ? TextOverflow.ellipsis : null,
        maxLines: maxLines,
      ),
    );
  }
}
