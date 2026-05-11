import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';

class SessionManager {
  SessionManager._();
  static final instance = SessionManager._();

  final _storage = StorageService<dynamic>();
  static const String _userKey = 'current_user';
  static const String _tokenKey = 'auth_token';

  Future<void> saveUser(UserModel user) async {
    await _storage.save(_userKey, value: user.toMap());
    if (user.apiToken != null) {
      await saveToken(user.apiToken!);
    }
  }

  UserModel? getUser() {
    final data = _storage.read(_userKey);
    if (data != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  Future<void> saveToken(String token) async {
    await _storage.save(_tokenKey, value: token);
  }

  String? getToken() {
    return _storage.read(_tokenKey);
  }

  bool get isLoggedIn => getToken() != null;

  Future<void> clear() async {
    _storage.delete(_userKey);
    _storage.delete(_tokenKey);
  }
}
