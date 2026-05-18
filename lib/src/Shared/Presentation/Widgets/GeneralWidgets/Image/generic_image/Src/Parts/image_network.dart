part of 'imports_parts.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final ImageOptions? options;

  const ImageNetwork({
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
          borderRadius: options?.borderRadius,
          shape: options?.radius != null ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          fadeInCurve: Curves.easeInBack,
          placeholder: (context, url) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            child: const AppLoader(),
          ),
          fit: options?.fit,
          errorWidget: (context, url, error) {
            // printDM(error.toString(), name: 'ImageNetwork');

            return Center(
              child: Image.asset(
                options?.onNetworkErrorImage ?? AppImages.noImage,
                fit: BoxFit.cover,
              ),
            );
          },
          // Center(child: const Icon(Icons.error, color: AppColors.errorColor)),
        ),
      ),
    );
  }
}
