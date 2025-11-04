import 'package:getx_base_code/src/Core/Services/Storage/src/storage_constants.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/models/local_user_model.dart';

import '../../Core/Services/Storage/storage_service.dart';
import '../../Core/Utils/general_utils.dart';
import '../../Core/Utils/utils.dart';

class UserCacheLocal {
  factory UserCacheLocal() => instance;

  UserCacheLocal._internal();

  static final UserCacheLocal instance = UserCacheLocal._internal();

  static final _storage = StorageService<Map<String, dynamic>>();

  Future<void> saveUser(LocalUserModel user) async {
    await _storage.save(
      stgLocalUserModel,
      value: user.toJson(),
    );
    //loginUser();
    printDM("User Saved From Cache => ${user.toJson()}");
  }

  LocalUserModel? get data {
    LocalUserModel? user;
    try {
      final data = _storage.read(
        stgLocalUserModel,
      );
      if (data == null) return null;
      user = LocalUserModel.fromJson(data);
      printDM("Local User Model is => ${user.toString()}");
    } catch (e) {
      printDM("Error in getting user from cache => $e");
    }
    //return _defaultUser;
    return user ?? _guestUser;
  }

  void logout() {
    // _storage.clear;
    _storage.delete(stgLocalUserModel);
    _storage.clear;
    logoutUser();
    printDM("User Deleted From Cache => ${data.toString()}");
  }

  LocalUserModel get _guestUser {
    return LocalUserModel(
      id: 0,
      name: "Guest${Utils.randomNumber()}",
      email: "",
      password: "",
      phone: "",
      roleId: 0,
    );
  }

  final _loginStorage = StorageService<bool>();

  bool get isAuth {
    // return true;
    final bool value =
        _loginStorage.read("login", defaultValue: false) ?? false;
    // final value =true;
    printDM("value $value");
    return value;
  }

  void loginUser() {
    _loginStorage.save("login", value: true);
  }

  void logoutUser() {
    _loginStorage.delete("login");
  }

  bool isMine({required int userId}) {
    final bool isMe = data?.id == userId;
    return isMe;
  }
}
