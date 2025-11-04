part of 'imports_parts.dart';

class ImageAsset extends StatelessWidget {
  final String url;
  final ImageOptions? options;
  const ImageAsset({
    super.key,
    required this.url,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: options?.scale ?? 1,
      child: Container(
        height: (options?.radius ?? options?.height)?.toH(),
        width: (options?.radius ?? options?.width)?.toW(),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: options?.backgroundColor,
          borderRadius: options?.borderRadius,
          shape: options?.radius != null ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Image.asset(
          url,
          // width: options?.width,
          // height: options?.height,
          fit: options?.fit,
          color: options?.color,
          alignment: options?.alignment ?? Alignment.center,
        ),
      ),
    );
  }
}
