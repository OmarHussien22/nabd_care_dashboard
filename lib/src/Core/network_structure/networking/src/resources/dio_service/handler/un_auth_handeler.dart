import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/caches/user_cache.dart';

import '../../../../../../utils/general_utils.dart';

class UnAuthHandler {
  UnAuthHandler._();
  static final _instance = UnAuthHandler._();
  factory UnAuthHandler() {
    return _instance;
  }

  void handleUnAuth() {
   // if (UserCache().isVisitor()) return;
    UserCache().logout();
    UserCache().logoutUser();
    printDM("handleUnAuth called");
    Get.offAll(() => const LoginPage());
  }

  void handelBlockUser() {
   // Get.offAll(() => const BlockedAccPage());
  }
}
