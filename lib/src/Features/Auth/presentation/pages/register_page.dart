part of 'imports_auth.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Put the controller
    Get.put(RegisterUserLocalController());
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: GetBuilder<RegisterUserLocalController>(
        builder: (logic) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;
              final width = constraints.maxWidth;

              if (!isWide) {
                // Mobile/Tablet View
                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 40),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo for mobile view
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 32),
                            decoration: BoxDecoration(
                              color: AppColors.get.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            // child: Icon(
                            //   Icons.app_registration_rounded,
                            //   size: 48,
                            //   color: AppColors.get.primary,
                            // ),
                          ),
                          _RegisterForm(logic: logic, node: node),
                        ],
                      ),
                    ),
                  ),
                );
              }

              // Desktop View (Split Screen)
              return Row(
                children: [
                  // Left Side: Register Form
                  Expanded(
                    flex: width > 1200 ? 7 : 6,
                    child: Center(
                      child: SingleChildScrollView(
                        // padding: const EdgeInsets.symmetric(

                        //     horizontal: 64, vertical: 48),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: _RegisterForm(logic: logic, node: node),
                        ),
                      ),
                    ),
                  ),

                  // Right Side: Branding
                  Expanded(
                    flex: width > 1200 ? 7 : 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.get.primary,
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            AppColors.get.primary,
                            AppColors.get.primaryDarker,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(-4, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              Icons.app_registration_rounded,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 48),
                          CustomText(
                            "Join CareDesk Today",
                            fontSize: 32,
                            fontWeight: FW.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: CustomText(
                              "Create an account to start managing your clinic, appointments, and patients with ease.",
                              fontSize: 16,
                              textAlign: TextAlign.center,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final RegisterUserLocalController logic;
  final FocusScopeNode node;

  const _RegisterForm({
    required this.logic,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: const ValueKey("RegisterForm"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            "Create Account",
            fontSize: 28,
            fontWeight: FW.bold,
            color: AppColors.get.title,
          ),
          const SizedBox(height: 12),
          CustomText(
            "Please fill in the details below to register.",
            fontSize: 14,
            color: AppColors.get.subTitle,
          ),
          const SizedBox(height: 48),

          // Name
          AppFillTextFieldField(
            width: 500,
            controller: logic.nameController,
            hint: "John Doe",
            header: "Full Name",
            prefixAsset: AppIcons.user,
            keyboardType: TextInputType.name,
            validation: AppValidator.defaultValidator.validate,
            onComplete: node.nextFocus,
          ),
          const SizedBox(height: 20),

          // Clinic Name
          AppFillTextFieldField(
            width: 500,
            controller: logic.clinicNameController,
            hint: "My Clinic",
            header: "Clinic Name",
            prefixAsset: AppIcons.user, // Verify icon
            keyboardType: TextInputType.text,
            validation: AppValidator.defaultValidator.validate,
            onComplete: node.nextFocus,
          ),
          const SizedBox(height: 20),

          // Email
          AppFillTextFieldField(
            width: 500,
            controller: logic.emailController,
            hint: "john@example.com",
            header: "Email Address",
            prefixAsset: AppIcons.user,
            keyboardType: TextInputType.emailAddress,
            validation: AppValidator.emailValidator.validate,
            onComplete: node.nextFocus,
          ),
          const SizedBox(height: 20),

          // Phone
          PhoneFormField(
            width: 500,
            controller: logic.phoneController,
            hasCountryCode: false,
            onComplete: node.nextFocus,
          ),
          const SizedBox(height: 20),

          // Role Selection
          SelectRolesSheet(),
          const SizedBox(height: 20),

          // Password
          AppPasswordField(
            width: 500,
            controller: logic.passwordController,
            onComplete: node.unfocus,
          ),
          const SizedBox(height: 48),

          // Register Button
          ButtonDefault(
            height: 56,
            width: double.infinity,
            isDisabled: logic.isButtonDisabled,
            title: "Register",
            onPressed: logic.register,
          ),
          const SizedBox(height: 32),

          // Login Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "Already have an account?",
                fontSize: 14,
                color: AppColors.get.subTitle,
              ),
              TextButton(
                onPressed: () => Get.off(() => const LoginPage(),
                    transition: Transition.noTransition),
                child: CustomText(
                  "Login",
                  fontSize: 14,
                  fontWeight: FW.bold,
                  color: AppColors.get.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
