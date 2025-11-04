part of 'imports_prefix.dart';

class PrefixWithWidget extends PrefixImp {
  PrefixWithWidget({
    required Widget widget,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
          widget: widget,
          constraintsHeight:
              constraintsHeight ?? TFFConstants.prefixConstrainsHeight,
          constraintsWidth:
              constraintsWidth ?? TFFConstants.prefixConstrainsWidth,
        );

  @override
  Widget render(BuildContext context) {
    return widget ?? const SizedBox.shrink();
  }
}
