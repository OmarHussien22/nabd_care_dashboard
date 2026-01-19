import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/imports_text_field.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Text/Implementation/imports_text.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Prefix/Implementation/imports_prefix.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Suffix/Implementation/imports_suffix.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Options/imports_options.dart';
import '../manager/login_user_local_controller.dart';
import 'register_page.dart';

class LoginPage extends GetView<LoginUserLocalController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginUserLocalController());
    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isDesktop = constraints.maxWidth > 900;
          return Row(
            children: [
              // Left Branding Panel (Desktop Only)
              if (isDesktop)
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.get.primary,
                          AppColors.get.lightPrimary,
                        ],
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/auth_bg.jpg'), // Placeholder
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(48.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            size: 64,
                            color: AppColors.get.white,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Medical Clinic\nManagement System',
                            style: TextStyle(
                              color: AppColors.get.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Streamline your practice with our comprehensive offline-first solution.',
                            style: TextStyle(
                              color: AppColors.get.white.withOpacity(0.9),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Right Content Panel
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 480),
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: AppColors.get.cardFill,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.get.shadow.withOpacity(0.05),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.get.cardBorder,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Mobile Logo (Visible only when desktop panel is hidden)
                          if (!isDesktop) ...[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.medical_services_outlined,
                                size: 48,
                                color: AppColors.get.primary,
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],

                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: AppColors.get.title,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Please enter your details to sign in.',
                            style: TextStyle(
                              color: AppColors.get.subTitle,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 48),

                          // Login Form
                          Form(
                            key: controller.globalKey,
                            child: Column(
                              children: [
                                TextFieldDefault(
                                  controller: controller.phoneController,
                                  header:
                                      const TFFHeader(title: "Email or Phone"),
                                  hint: const TFFHint(
                                      title: "Enter your email or phone"),
                                  prefix: PrefixWithIconData(
                                    iconData: Icons.person_outline_rounded,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validation: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "This field is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 24),
                                ValueBuilder<bool>(
                                  initialValue: true,
                                  builder: (isObscure, updateFn) {
                                    return TextFieldDefault(
                                      controller: controller.passwordController,
                                      header:
                                          const TFFHeader(title: "Password"),
                                      hint: const TFFHint(
                                          title: "Enter your password"),
                                      prefix: PrefixWithIconData(
                                        iconData: Icons.lock_outline_rounded,
                                      ),
                                      secureType: SecureType.toggle,
                                      suffix: SuffixPassword(
                                        color: AppColors.get.tTFSuffixIcon,
                                        showPassword: !isObscure,
                                        onTap: () => updateFn(!isObscure),
                                      ),
                                      validation: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      },
                                      onComplete: () => controller.login(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Actions
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value:
                                          true, // TODO: Link to controller state
                                      onChanged: (val) {},
                                      activeColor: AppColors.get.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                      color: AppColors.get.lightText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {}, // TODO: Forgot Password
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColors.get.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Login Button
                          GetBuilder<LoginUserLocalController>(
                            builder: (ctrl) {
                              return SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: ctrl.isButtonDisabled
                                      ? null
                                      : () => ctrl.login(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.get.primary,
                                    foregroundColor: AppColors.get.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBackgroundColor:
                                        AppColors.get.disabled,
                                  ),
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 32),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: AppColors.get.subTitle,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const RegisterPage());
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: AppColors.get.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
