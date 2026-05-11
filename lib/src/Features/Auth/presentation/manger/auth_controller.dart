import 'package:get/get.dart';
import '../../core/session_manager.dart';
import '../../../../Shared/Models/user_model.dart';

class AuthController extends GetxController {
  AuthController._();
  static final instance = AuthController._();

  final _sessionManager = SessionManager.instance;

  final Rxn<UserModel> _user = Rxn<UserModel>();
  UserModel? get user => _user.value;

  final RxBool _isAuthenticated = false.obs;
  bool get isAuthenticated => _isAuthenticated.value;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  void _checkAuthStatus() {
    final storedUser = _sessionManager.getUser();
    if (storedUser != null) {
      _user.value = storedUser;
      _isAuthenticated.value = true;
    } else {
      _isAuthenticated.value = false;
    }
  }

  Future<void> setAuthenticatedUser(UserModel user) async {
    await _sessionManager.saveUser(user);
    _user.value = user;
    _isAuthenticated.value = true;
  }

  Future<void> clearAuthentication() async {
    await _sessionManager.clear();
    _user.value = null;
    _isAuthenticated.value = false;
  }
}
