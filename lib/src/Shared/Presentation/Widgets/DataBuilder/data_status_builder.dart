part of 'imports_data_builder.dart';

class DataStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget? initialBuild;
  final Widget onDoneBuild;
  final Widget? onConnectionErrorBuild;
  final Widget? onErrorBuild;
  final Widget? onLoadingBuild;
  final VoidCallback? onRedirect;
  final bool isOnRefreshed;
  final bool isImportant;
  final bool? isFullScreen;
  final double? heightRation;
  final bool useShimmer;

  const DataStatusBuilder({
    super.key,
    required this.status,
    required this.onDoneBuild,
    this.onConnectionErrorBuild,
    this.initialBuild,
    this.onErrorBuild,
    this.onLoadingBuild,
    this.onRedirect,
    this.isOnRefreshed = false,
    this.isImportant = true,
    this.heightRation,
    this.isFullScreen,
    this.useShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget? widget = const SizedBox.shrink();
    if (status is DataInitial) {
      widget = isImportant
          ? (initialBuild ?? const SizedBox.shrink())
          : const Center();
      // widget = Center();
    } else if (status is DataLoading) {
      widget = isImportant
          ? (onLoadingBuild ??
              (isOnRefreshed
                  ? const SizedBox.shrink()
                  : useShimmer
                      ? Skeletonizer(
                          enabled: true,
                          child: onDoneBuild,
                        )
                      : AppLoader(
                          isFullScreen: isFullScreen,
                          heightRatio: heightRation,
                        )))
          : const Center();
    } else if (status is DataSuccess) {
      widget = onDoneBuild;
    } else if (status is DataFailed) {
      widget = isImportant
          ? (onErrorBuild ??
              _DataFailedBuilder(
                errorModel: status.error,
                onRedirect: onRedirect,
              ))
          : const Center();
    } else {
      widget = isImportant
          ? (onLoadingBuild ??
              (isOnRefreshed
                  ? const SizedBox.shrink()
                  : AppLoader(
                      isFullScreen: isFullScreen,
                      heightRatio: heightRation,
                    )))
          : const Center();
    }
    return widget;
  }

  factory DataStatusBuilder.empty({
    required DataState status,
    required Widget onDoneBuild,
  }) {
    return DataStatusBuilder(
      status: status,
      onDoneBuild: onDoneBuild,
      initialBuild: const SizedBox.shrink(),
      onConnectionErrorBuild: const SizedBox.shrink(),
      onErrorBuild: const SizedBox.shrink(),
      onLoadingBuild: const SizedBox.shrink(),
      isOnRefreshed: false,
      onRedirect: null,
    );
  }
}
