part of 'imports_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginUserLocalController());
    final node = FocusScope.of(context);

    // Using LayoutBuilder to get responsive constraints
    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: GetBuilder<LoginUserLocalController>(
        builder: (logic) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              if (!isWide) {
                // Mobile/Tablet View (Vertical)
                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: _LoginForm(logic: logic, node: node),
                    ),
                  ),
                );
              }

              // Desktop View (Split Screen)
              return Row(
                children: [
                  // Left Side: Login Form
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          child: _LoginForm(logic: logic, node: node),
                        ),
                      ),
                    ),
                  ),

                  // Right Side: Branding / Hero
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.get.primary,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
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
                        // image: DecorationImage(
                        //   image: AssetImage("assets/images/login_bg.png"), // Placeholder if you have an image
                        //   fit: BoxFit.cover,
                        //   opacity: 0.1,
                        // ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Logo Container
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.medical_services_rounded,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Title
                          CustomText(
                            "CareDesk System",
                            fontSize: 18,
                            fontWeight: FW.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          // Subtitle
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 64),
                            child: CustomText(
                              "Manage your clinic efficiently with our comprehensive desktop solution.",
                              fontSize: 12,
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

class _LoginForm extends StatelessWidget {
  final LoginUserLocalController logic;
  final FocusScopeNode node;

  const _LoginForm({required this.logic, required this.node});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: logic.globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Header
          CustomText(
            "Welcome Back",
            fontSize: 22,
            fontWeight: FW.bold,
            color: AppColors.get.title,
          ),
          const SizedBox(height: 8),
          CustomText(
            "Please enter your account to sign in.",
            fontSize: 18,
            color: AppColors.get.subTitle,
          ),
          const SizedBox(height: 48),
          // Phone Field
          // CustomText(
          //   "Phone Number",
          //   fontSize: 16,
          //   fontWeight: FW.semiBold,
          //   color: AppColors.get.title,
          // ),
          // const SizedBox(height: 8),
          PhoneFormField(
            width: MediaQuery.of(context).size.width * .4,
            controller: logic.phoneController,
            hasCountryCode: false,
            onComplete: node.nextFocus,
          ),
          const SizedBox(height: 24),

          // Password Field
          // CustomText(
          //   "Password",
          //   fontSize: 16,
          //   fontWeight: FW.semiBold,
          //   color: AppColors.get.title,
          // ),
          // const SizedBox(height: 8),
          AppPasswordField(
            width: MediaQuery.of(context).size.width * .4,
            hint: "Enter your password",
            controller: logic.passwordController!,
            onComplete: () {
              node.unfocus();
              logic.login();
            },
          ),

          const SizedBox(height: 42),

          // Login Button
          Center(
            child: ButtonDefault(
              height: 54,
              width: 350,
              isDisabled: logic.isButtonDisabled,
              title: "Sign In",
              titleSize: 16,
              onPressed: logic.login,
            ),
          ),

          const SizedBox(height: 24),

          // // Register Link
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CustomText(
          //       "Don't have an account?",
          //       //fontSize: 4.5,
          //       color: AppColors.get.subTitle,
          //     ),
          //     TextButton(
          //       onPressed: () => Get.off(() => const RegisterPage(),
          //           transition: Transition.noTransition),
          //       child: CustomText(
          //         "Sign up",
          //         // fontSize: 4.5,
          //         fontWeight: FW.bold,
          //         color: AppColors.get.primary,
          //       ),
          //     ),
          //   ],
          // ),

          const SizedBox(height: 24),
          //  const Center(child: FooterLogin()),
        ],
      ),
    );
  }
}
