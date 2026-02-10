import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Core/Utils/utils.dart';

import '../../../../../Shared/Managers/user_controller.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Utils/general_utils.dart';

class HeaderHandler {
  HeaderHandler._();

  static HeaderHandler instance = HeaderHandler._();

  /// set header
  Map<String, String> setHeaders(bool isAuth) {
    String token = "";
    // final StorageService<bool> box = StorageService<bool>();
    if (isAuth) {
      token = UserController.get.user?.apiToken ?? "";
      // token = "16|IidujcKZuyZ4yLlMySvXJgAVz8E7w3DmMFJb9S6L9789ff30";
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
      'android_version': AppStrings.localAppAndroidVersion.toString(),
      'ios_version': AppStrings.localAppIosVersion.toString(),
      if (isAuth && (token != "")) 'Authorization': 'Bearer $token'
    };
  }
}
