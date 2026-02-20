import '../../../../../shared/caches/user_cache.dart';
import '../../../../constants/strings/app_strings.dart';
import '../../../../utils/general_utils.dart';
import '../../../../utils/utils.dart';

class HeaderHandler {
  HeaderHandler._();

  static HeaderHandler instance = HeaderHandler._();

  /// set header
  Map<String, String> setHeaders(bool isAuth) {
    String token = "";
    if (isAuth) {
      // token = UserController.get.user?.apiToken ?? "";
      token = "11|MBenkMgBJiat4o66ImeNDonRrF8ZfT7Gt67dzbxna29ed140";
      printDM("token => $token");
      // // UserCache.instance.data.then((value) {
      // //   if (value != null) {
      // //     token = value.apiToken ?? '';
      // //   }
      // // }
      // // );
      // final user = UserCache.instance.data;
      // token = user?.apiToken ?? "";
    }

    return {
      'Accept-Language': Utils.cachedLocale.languageCode,
      'android_version': AppStrings.appAndroidVersion.toString(),
      'ios_version': AppStrings.appIOSVersion.toString(),
      'desktop_version': AppStrings.appDesktopVersion.toString(),
      'web_version': AppStrings.appDesktopVersion.toString(),
      'Accept': 'application/json',
      if (isAuth && (token != "")) 'Authorization': 'Bearer $token',
      if (UserCache.instance.data != null)
        "userId": "${UserCache.instance.data?.id}",
    };
  }
}
