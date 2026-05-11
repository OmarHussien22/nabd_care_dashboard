import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
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
    NavigationService.instance.go('/login');
  }

  void handelBlockUser() {
   // Get.offAll(() => const BlockedAccPage());
  }
}
