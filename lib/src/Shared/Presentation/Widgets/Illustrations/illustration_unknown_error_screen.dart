part of 'imports_illustrations.dart';

class IllustrationUnKnownErrorScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  const IllustrationUnKnownErrorScreen({super.key, this.onRedirect});

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      title: "illustration_unknown".toTr(),
      body: "illustration_unknown_details".toTr(),
      imageUrl: Assets.anjo,
      height: 100.toH(),
      width: 100.toW(),
      onRedirect: onRedirect ??
          () {
            context.back();
          },
    );
  }
}
