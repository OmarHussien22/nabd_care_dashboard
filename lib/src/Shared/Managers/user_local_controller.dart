import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Services/Storage/src/storage_constants.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/models/local_user_model.dart';
import 'package:getx_base_code/src/Shared/Caches/user_cache_local.dart';

import '../../Core/Services/Storage/storage_service.dart';
import '../../Super/Controllers/Resources/get/get_controller_interface.dart';

class UserLocalController extends GetControllerInterface {
  static UserLocalController get get => Get.put(UserLocalController());

  final StorageService<LocalUserModel> _storage =
      StorageService<LocalUserModel>();

  LocalUserModel? _user;

  LocalUserModel? get user => _user;

  @override
  void onInit() {
    _user = UserCacheLocal().data;
    _storage.listenKey(stgLocalUserModel, (value) {
      _user = LocalUserModel.fromJson(value);
      update();
    });
    super.onInit();
  }

  Future<void> updateUser(LocalUserModel? user) async {
    _user = user;
    if (user != null) {
      await UserCacheLocal().saveUser(user);
    }
    update();
  }
}
