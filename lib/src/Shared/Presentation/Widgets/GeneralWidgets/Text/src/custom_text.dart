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
    this.fontSize = 14, // Updated for desktop
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
    double fontSize = 12.0, // Updated for desktop
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
    double fontSize = 12.0, // Updated for desktop
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
    double fontSize = 24.0, // Updated for desktop
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
    final screenWidth = MediaQuery.of(context).size.width;

    double baseFontSize = fontSize ?? 16;
    double finalFontSize = baseFontSize;

    if (screenWidth >= 1024) {
      // Desktop && Web
      finalFontSize = baseFontSize * 1.4;
    } else if (screenWidth >= 600) {
      // Tablet
      finalFontSize = baseFontSize * 1.25;
    } else {
      // Mobile
      finalFontSize = baseFontSize *3;
    }

    // Responsive padding
    EdgeInsetsGeometry? finalPadding = padding;
    if (finalPadding is EdgeInsets) {
      if (screenWidth >= 1024) {
        finalPadding = finalPadding * 1.5;
      } else if (screenWidth >= 600) {
        finalPadding = finalPadding * 1.25;
      }
    }
    return Padding(
      padding: finalPadding ?? EdgeInsets.zero,
      child: Text(
        customTextLabel(
          label: label,
          isUpperCase: isUpperCase,
        ),
        textScaler: TextScaler.noScaling,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              backgroundColor: backgroundColor,
              fontSize: finalFontSize.toFS(), // Use calculated font size
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
