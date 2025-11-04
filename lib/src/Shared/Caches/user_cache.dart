import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../../Core/Services/Storage/storage_service.dart';
import '../../Core/Services/storage/src/storage_constants.dart';
import '../../Core/Utils/general_utils.dart';
import '../../Core/Utils/utils.dart';

class UserCache {
  factory UserCache() => instance;

  UserCache._internal();

  static final UserCache instance = UserCache._internal();

  static final _storage = StorageService<Map<String, dynamic>>();

  Future<void> saveUser(UserModel user) async {
    await _storage.save(
      stgUserModel,
      value: user.toMap(),
    );
    //loginUser();
    printDM("User Saved From Cache => ${user.toMap()}");
  }

  UserModel? get data {
    UserModel? user;
    try {
      final data = _storage.read(
        stgUserModel,
      );
      if (data == null) return null;
      user = UserModel.fromJson(data);
      printDM("User Model is => ${user.toString()}");
    } catch (e) {
      printDM("Error in getting user from cache => $e");
    }
    //return _defaultUser;
    return user ?? _guestUser;
  }

  void logout() {
    // _storage.clear;
    _storage.delete(stgUserModel);
    logoutUser();
    printDM("User Deleted From Cache => ${data.toString()}");
  }

  UserModel get _guestUser {
    return UserModel(
      id: 0,
      name: "Guest${Utils.randomNumber()}",
      phone: "-",
      image:
          "https://yt3.googleusercontent.com/uBxEzJWmk3pCDWu5glP-UeCAbTV8y71CGYlRiWOVs6j_EPQYPxj3Ke6YQdBjmpHy2rnbZ4AFUg=s900-c-k-c0x00ffffff-no-rj",
      apiToken: 'token',
      isPhoneVerify: false,
      code: "0",
      email: '',
      userType: "",
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
