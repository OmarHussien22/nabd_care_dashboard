part of 'imports_suffix.dart';

class SuffixWithIconData extends SuffixImp {
  SuffixWithIconData({
    required IconData super.iconData,
    Color? color,
    double? size,
    double? scale,
    super.onTap,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
            constraintsHeight: constraintsHeight??TFFConstants.suffixConstrainsHeight,
            constraintsWidth: constraintsWidth??TFFConstants.suffixConstrainsWidth,
            color: color ?? AppColors.get.tTFSuffixIcon,
            size: size?? TFFConstants.suffixIconSize,
            scale: scale??TFFConstants.suffixIconScale);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
        child: Icon(
          iconData,
          color: color,
          size: size?.toW(),
        ),
      ),
    );
  }
}
