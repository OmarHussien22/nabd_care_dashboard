import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class CheckNetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  
  final RxBool isOnline = true.obs;
  final RxBool isChecking = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  Future<void> _checkInitialConnection() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (_) {
      isOnline.value = false;
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      isOnline.value = false;
    } else {
      isOnline.value = true;
    }
  }

  Future<bool> forceRecheck() async {
    isChecking.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 800)); // simulated check delay
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (_) {
      isOnline.value = false;
    } finally {
      isChecking.value = false;
      update();
    }
    return isOnline.value;
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
