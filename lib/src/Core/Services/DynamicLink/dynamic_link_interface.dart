
abstract class DynamicLinkInterface {
  //get initial link
  Future<Uri?> getInitialLink();
  //on create link
  Future<String> createDynamicLink({
    required int id,
    required bool short,
    required String title,
    required String description,
    required String image,
  });
  //on open from link
  Future<void> retrieveDynamicLink();
}
