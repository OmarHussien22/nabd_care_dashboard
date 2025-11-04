part of 'imports_data_builder.dart';

class _DataFailedBuilder extends StatelessWidget {
  final ErrorModel? errorModel;
  final VoidCallback? onRedirect;

  const _DataFailedBuilder({
    super.key,
    required this.errorModel,
    this.onRedirect,
  });

  @override
  Widget build(BuildContext context) {
    switch (errorModel?.type ?? ErrorType.unKnown) {
      case ErrorType.serverSide:
        return IllustrationUnKnownErrorScreen(
          onRedirect: onRedirect,
        );
      case ErrorType.networkConnection:
        return IllustrationNoConnectionScreen(onRedirect: onRedirect);

      case ErrorType.dataEmpty:
        return SimpleErrorHandlerBuilder(error: errorModel);
      case ErrorType.unKnown:
        return IllustrationUnKnownErrorScreen(
          onRedirect: onRedirect,
        );

      case ErrorType.dirtyData:
        return SimpleErrorHandlerBuilder(
          error: errorModel,
        );
      case ErrorType.statusFalse:
        return SimpleErrorHandlerBuilder(
          error: errorModel,
        );
    }
  }
}
