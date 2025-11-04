part of 'imports_suffix.dart';

class SuffixWithWidget extends SuffixImp {
  SuffixWithWidget({
    required Widget widget,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
          widget: widget,
          constraintsHeight:
              constraintsHeight ?? TFFConstants.suffixConstrainsHeight,
          constraintsWidth:
              constraintsWidth ?? TFFConstants.suffixConstrainsWidth,
        );

  @override
  Widget render(BuildContext context) {
    return widget ?? const SizedBox.shrink();
  }
}
