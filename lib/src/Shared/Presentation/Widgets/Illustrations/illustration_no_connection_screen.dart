part of 'imports_illustrations.dart';

class IllustrationNoConnectionScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  const IllustrationNoConnectionScreen({
    super.key,
    this.onRedirect,
  });

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      title: "illustration_no_connection",
      body: "illustration_no_connection_details",
      imageUrl: Assets.anjo,
      showRedirectIcon: false,
      onRedirect: onRedirect ??
          () {
            context.back();
          },
    );
  }
}
