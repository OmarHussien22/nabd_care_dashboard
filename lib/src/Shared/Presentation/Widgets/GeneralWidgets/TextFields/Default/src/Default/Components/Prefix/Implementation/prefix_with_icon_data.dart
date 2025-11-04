part of 'imports_prefix.dart';

class PrefixWithIconData extends PrefixImp {
  PrefixWithIconData({
    required IconData iconData,
    Color? color,
    double? size,
    double? scale,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
          iconData: iconData,
          // constraintsHeight: constraintsHeight??TFFConstants.prefixConstrainsHeight,
          // constraintsWidth: constraintsWidth??TFFConstants.prefixConstrainsWidth,
          color: color ?? TFFConstants.color.tTFPrefixColor,
          size: size ?? TFFConstants.prefixIconSize,
          scale: scale ?? TFFConstants.prefixIconScale,
        );

  @override
  Widget render(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Icon(
        iconData,
        color: color,
        size: (size)?.toW(),
      ),
    );
  }
}
