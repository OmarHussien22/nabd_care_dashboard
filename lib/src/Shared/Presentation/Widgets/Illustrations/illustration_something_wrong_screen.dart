part of 'imports_illustrations.dart';

class IllustrationSomethingWrongScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  final bool hideAppBar;

  const IllustrationSomethingWrongScreen({
    super.key,
    this.onRedirect,
    this.hideAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      // hideAppBar: hideAppBar,
      title: "illustration_something_went_wrong",
      body: "illustration_something_went_wrong_details",
       imageUrl: Assets.somethingWrong,
      showRedirectIcon: false,
      onRedirect: onRedirect ?? () => context.back(),
    );
  }
}
