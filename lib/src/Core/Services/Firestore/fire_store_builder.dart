part of 'imports_fire_store.dart';
class FireStoreBuilder extends StatelessWidget {
  final FireStoreStatus status;
  final Widget onDoneBuild;
  final Widget? onConnectionErrorBuild;
  final Widget? onErrorBuild;
  final Widget? onLoadingBuild;

  const FireStoreBuilder(
      {super.key,
      required this.status,
      required this.onDoneBuild,
      this.onConnectionErrorBuild,
      this.onErrorBuild,
      this.onLoadingBuild});

  @override
  Widget build(BuildContext context) {
    Widget? widget = const SizedBox.shrink();
    if (status is FireStoreLoading) {
      widget = onLoadingBuild ?? const AppLoader();
// widget = AppLoader();
    } else if (status is FireStoreSuccess) {
      widget = onDoneBuild;
// widget = Center();
    } else if (status is FireStoreFailed) {
      widget = onErrorBuild ??
          _FireStoreFailedBuilder(

          );
    } else {
      widget = onLoadingBuild ?? const AppLoader();
    }
    return widget;
  }
}

class _FireStoreFailedBuilder extends StatelessWidget {
  const _FireStoreFailedBuilder();

  @override
  Widget build(BuildContext context) {
    return const IllustrationUnKnownErrorScreen();
  }
}
