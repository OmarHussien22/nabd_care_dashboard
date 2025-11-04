part of 'imports_options.dart';

abstract class TffBorders {
  static InputBorder getBorder({
    required InputDecorationImp inputDecoration,
    required BorderType type,
  }) {
    switch (type) {
      case BorderType.border:
        BorderSide borderSide = BorderSide(
          color: inputDecoration.borderColor ?? TFFConstants.color.tTFBorder,
          width: (inputDecoration.borderWidth ?? TFFConstants.tffBorderWidth)
              .toW(),
        );
        return GenericConditionalBuilder<InputBorder>(
          condition: inputDecoration is InputDecorationWithBorder,
          onBuild: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                (inputDecoration.borderRadius ?? TFFConstants.tffBorderRadius)
                    .toRad()),
            borderSide: borderSide,
          ),
          onFeedBack: UnderlineInputBorder(borderSide: borderSide),
        ).build;
      case BorderType.disabled:
        BorderSide borderSide = BorderSide(
          color: inputDecoration.disableBorderColor ??
              TFFConstants.color.tTFDisableBorder,
          width: (inputDecoration.disableBorderWidth ??
                  TFFConstants.tffBorderWidth)
              .toW(),
        );
        return GenericConditionalBuilder<InputBorder>(
          condition: inputDecoration is InputDecorationWithBorder,
          onBuild: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                (inputDecoration.disableBorderRadius ??
                        TFFConstants.tffBorderRadius)
                    .toRad()),
            borderSide: borderSide,
          ),
          onFeedBack: UnderlineInputBorder(borderSide: borderSide),
        ).build;
      case BorderType.enable:
        BorderSide borderSide = BorderSide(
          color: inputDecoration.enableBorderColor ??
              TFFConstants.color.tTFEnableBorder,
          width:
              (inputDecoration.enableBorderWidth ?? TFFConstants.tffBorderWidth)
                  .toW(),
        );
        return GenericConditionalBuilder<InputBorder>(
          condition: inputDecoration is InputDecorationWithBorder,
          onBuild: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                (inputDecoration.enableBorderRadius ??
                        TFFConstants.tffBorderRadius)
                    .toRad()),
            borderSide: borderSide,
          ),
          onFeedBack: UnderlineInputBorder(borderSide: borderSide),
        ).build;
      case BorderType.error:
        BorderSide borderSide = BorderSide(
          color: inputDecoration.errorBorderColor ??
              TFFConstants.color.tTFErrorBorder,
          width:
              (inputDecoration.errorBorderWidth ?? TFFConstants.tffBorderWidth)
                  .toW(),
        );
        return GenericConditionalBuilder<InputBorder>(
          condition: inputDecoration is InputDecorationWithBorder,
          onBuild: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                (inputDecoration.errorBorderRadius ??
                        TFFConstants.tffBorderRadius)
                    .toRad()),
            borderSide: borderSide,
          ),
          onFeedBack: UnderlineInputBorder(borderSide: borderSide),
        ).build;
      case BorderType.focus:
        BorderSide borderSide = BorderSide(
          color: inputDecoration.focusBorderColor ??
              TFFConstants.color.tTFFocusBorder,
          width:
              (inputDecoration.focusBorderWidth ?? TFFConstants.tffBorderWidth)
                  .toW(),
        );
        return GenericConditionalBuilder<InputBorder>(
          condition: inputDecoration is InputDecorationWithBorder,
          onBuild: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                (inputDecoration.focusBorderRadius ??
                        TFFConstants.tffBorderRadius)
                    .toRad()),
            borderSide: borderSide,
          ),
          onFeedBack: UnderlineInputBorder(borderSide: borderSide),
        ).build;
    }
  }
}
