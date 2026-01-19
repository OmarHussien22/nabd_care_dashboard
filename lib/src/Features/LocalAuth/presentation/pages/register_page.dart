import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/imports_text_field.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Text/Implementation/imports_text.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Prefix/Implementation/imports_prefix.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Suffix/Implementation/imports_suffix.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Options/imports_options.dart';
import '../manager/register_user_local_controller.dart';
import 'login_page.dart';

class RegisterPage extends GetView<RegisterUserLocalController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterUserLocalController());
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
                            'Join CareDesk',
                            style: TextStyle(
                              color: AppColors.get.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Create your clinic account and start managing your practice efficiently.',
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
                          // Mobile Logo
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
                            'Create Account',
                            style: TextStyle(
                              color: AppColors.get.title,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enter your details to register your clinic.',
                            style: TextStyle(
                              color: AppColors.get.subTitle,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.get.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      AppColors.get.primary.withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline,
                                    color: AppColors.get.primary, size: 20),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    "This account will be the owner of the clinic dashboard.",
                                    style: TextStyle(
                                      color: AppColors.get.title,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Register Form
                          Form(
                            key: controller.globalKey,
                            child: Column(
                              children: [
                                TextFieldDefault(
                                  controller: controller.nameController,
                                  header: const TFFHeader(title: "Full Name"),
                                  hint: const TFFHint(title: "Dr. John Doe"),
                                  prefix: PrefixWithIconData(
                                      iconData: Icons.person_outline),
                                  validation: (val) =>
                                      val?.isEmpty == true ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                TextFieldDefault(
                                  controller: controller.clinicNameController,
                                  header: const TFFHeader(title: "Clinic Name"),
                                  hint: const TFFHint(title: "CareDesk Clinic"),
                                  prefix: PrefixWithIconData(
                                      iconData: Icons.local_hospital_outlined),
                                  validation: (val) =>
                                      val?.isEmpty == true ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                TextFieldDefault(
                                  controller: controller.emailController,
                                  header: const TFFHeader(title: "Email"),
                                  hint:
                                      const TFFHint(title: "john@example.com"),
                                  prefix: PrefixWithIconData(
                                      iconData: Icons.email_outlined),
                                  keyboardType: TextInputType.emailAddress,
                                  validation: (val) {
                                    if (val == null || val.isEmpty)
                                      return "Required";
                                    if (!GetUtils.isEmail(val))
                                      return "Invalid email";
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFieldDefault(
                                  controller: controller.phoneController,
                                  header: const TFFHeader(title: "Phone"),
                                  hint: const TFFHint(title: "+1 234 567 890"),
                                  prefix: PrefixWithIconData(
                                      iconData: Icons.phone_outlined),
                                  keyboardType: TextInputType.phone,
                                  validation: (val) =>
                                      val?.isEmpty == true ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                ValueBuilder<bool>(
                                    initialValue: true,
                                    builder: (isObscure, updateFn) {
                                      return TextFieldDefault(
                                        controller:
                                            controller.passwordController,
                                        header:
                                            const TFFHeader(title: "Password"),
                                        hint: const TFFHint(title: "••••••••"),
                                        prefix: PrefixWithIconData(
                                            iconData: Icons.lock_outline),
                                        secureType: SecureType.toggle,
                                        suffix: SuffixPassword(
                                          color: AppColors.get.tTFSuffixIcon,
                                          showPassword: !isObscure,
                                          onTap: () => updateFn(!isObscure),
                                        ),
                                        validation: (val) {
                                          if (val == null || val.length < 6)
                                            return "Min 6 chars";
                                          return null;
                                        },
                                      );
                                    }),
                                const SizedBox(height: 16),
                                ValueBuilder<bool>(
                                    initialValue: true,
                                    builder: (isObscure, updateFn) {
                                      return TextFieldDefault(
                                        header: const TFFHeader(
                                            title: "Confirm Password"),
                                        hint: const TFFHint(title: "••••••••"),
                                        prefix: PrefixWithIconData(
                                            iconData: Icons.lock_outline),
                                        secureType: SecureType.toggle,
                                        suffix: SuffixPassword(
                                          color: AppColors.get.tTFSuffixIcon,
                                          showPassword: !isObscure,
                                          onTap: () => updateFn(!isObscure),
                                        ),
                                        validation: (val) {
                                          if (val !=
                                              controller
                                                  .passwordController.text) {
                                            return "Passwords do not match";
                                          }
                                          return null;
                                        },
                                      );
                                    }),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Action Button
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.globalKey.currentState!
                                    .validate()) {
                                  controller.register();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.get.primary,
                                foregroundColor: AppColors.get.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Create Clinic Account",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  color: AppColors.get.subTitle,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAll(() => const LoginPage());
                                },
                                child: Text(
                                  "Login",
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
