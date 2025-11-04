import 'package:get/get.dart';
import '../../Core/Services/Storage/storage_service.dart';
import '../../Core/Services/storage/src/storage_constants.dart';
import '../Models/user_model.dart';
import '../Caches/user_cache.dart';
import '../../Super/Controllers/Resources/get/get_controller_interface.dart';

class UserController extends GetControllerInterface {
  static UserController get get => Get.put(UserController());

  final StorageService<UserModel> _storage = StorageService<UserModel>();

  UserModel? _user;

  UserModel? get user => _user;

  @override
  void onInit() {
    _user = UserCache().data;
    _storage.listenKey(stgUserModel, (value) {
      _user = UserModel.fromJson(value);
      update();
    });
    super.onInit();
  }

  Future<void> updateUser(UserModel? user) async {
    _user = user;
    if (user != null) {
      await UserCache().saveUser(user);
    }
    update();
  }
}
