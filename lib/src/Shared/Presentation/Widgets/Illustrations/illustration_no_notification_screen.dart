part of 'imports_illustrations.dart';

class IllustrationNoNotificationsScreen extends StatelessWidget {
  final VoidCallback? onRedirect;

  const IllustrationNoNotificationsScreen({
    super.key,
    this.onRedirect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IllustrationPageBuilder(
        title: "illustration_no_notifications",
        body: "illustration_no_notifications_details",
        imageUrl: Assets.noNotifications,
        height: 160.toH(),
        width: 180.toW(),
        fontSizeTitle: 22,
        showRedirectIcon: false,
        // onRedirect: onRedirect??  () {
        //   context.back();
        // },
      ),
    );
  }
}
