part of 'app_router_imports.dart';

abstract class BaseRouteArgs {}

/// ------------------ Auth ------------------
class VerifyCodeArgs extends BaseRouteArgs {
  final String phone;
  final bool isRegister;
  final String? title;
  final bool viewPhone;
  final VoidCallback? onSuccess;

  VerifyCodeArgs({
    this.title,
    this.viewPhone = false,
    this.onSuccess,
    required this.phone,
    this.isRegister = false,
  });
}

class ResetPasswordArgs extends BaseRouteArgs {
  final String phone;
  final String countryCode;
  final String code;

  ResetPasswordArgs({
    required this.phone,
    required this.countryCode,
    required this.code,
  });
}

class VerificationArgs extends BaseRouteArgs {
  final String? title;
  final String? phone;
  final String? countryCode;
  final bool? register;
  final Function(String)? onSuccess;

  VerificationArgs({
    this.title,
    this.phone,
    this.countryCode,
    this.register,
    this.onSuccess,
  });
}

