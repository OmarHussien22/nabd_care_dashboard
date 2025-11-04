part of 'imports_prefix.dart';

class PrefixWithIconImage extends PrefixImp {
  PrefixWithIconImage({
    required String iconImage,
    Color? color,
    double? size,
    double? scale,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
          iconImage: iconImage,
          constraintsHeight: constraintsHeight ?? TFFConstants.prefixConstrainsHeight,
          constraintsWidth: constraintsWidth ?? TFFConstants.prefixConstrainsWidth,
          color: color ?? TFFConstants.color.tTFPrefixColor,
          size: size ?? TFFConstants.prefixImageSize,
          scale: scale ?? TFFConstants.prefixImageScale,
        );

  @override
  Widget render(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: scale,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(2),
            child: ConditionalBuilder(
              condition: (iconImage ?? "").contains("http"),
              onBuild: ImageIcon(
                NetworkImage("$iconImage"),
                color: color,
                size: size?.toW(),
              ),
              onFeedBack: ImageIcon(
                AssetImage("$iconImage"),
                color: color,
                size: size?.toW(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
