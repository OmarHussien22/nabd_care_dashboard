part of 'imports_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: GetBuilder<LoginController>(
        builder: (logic) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isWide = screenWidth > 900;
          final formMaxWidth = 480.0;

          final loginForm = _LoginForm(logic: logic, node: node, maxWidth: formMaxWidth);

          if (!isWide) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.get.primary.withOpacity(0.05),
                    AppColors.get.background,
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: loginForm,
                ),
              ),
            );
          }

          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.get.background,
                    image: const DecorationImage(
                      image: NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
                      opacity: 0.05,
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: loginForm,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.get.primary,
                        AppColors.get.primary.withRed(50),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.local_hospital_rounded,
                          size: 80.toW(),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40.toH()),
                      CustomText(
                        "CareDesk Pro",
                        fontSize: 32,
                        fontWeight: FW.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.toH()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 64.toW()),
                        child: CustomText(
                          "The complete ecosystem for modern healthcare management. Experience the future of clinic operations.",
                          fontSize: 15,
                          textAlign: TextAlign.center,
                          color: Colors.white.withOpacity(0.8),
                          textHeight: 1.5,
                        ),
                      ),
                    ],
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

class _LoginForm extends StatelessWidget {
  final LoginController logic;
  final FocusScopeNode node;
  final double maxWidth;

  const _LoginForm({
    required this.logic,
    required this.node,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: EdgeInsets.all(40.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.toRad()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Form(
        key: logic.globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              "Login to Dashboard",
              fontSize: 24,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
            SizedBox(height: 12.toH()),
            CustomText(
              "Welcome back! Please enter your details.",
              fontSize: 14,
              color: AppColors.get.textSecondary,
            ),
            SizedBox(height: 40.toH()),
            
            PhoneFormField(
              width: double.infinity,
              controller: logic.phoneController,
              hasCountryCode: false,
              onComplete: node.nextFocus,
            ),
            SizedBox(height: 24.toH()),

            AppPasswordField(
              width: double.infinity,
              hint: "••••••••",
              controller: logic.passwordController!,
              onComplete: () {
                node.unfocus();
                logic.login();
              },
            ),

            SizedBox(height: 16.toH()),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: CustomText("Forgot Password?", color: AppColors.get.primary, fontSize: 13, fontWeight: FW.semiBold),
              ),
            ),

            SizedBox(height: 32.toH()),

            ButtonDefault(
              height: 56.toH(),
              width: double.infinity,
              isDisabled: logic.isButtonDisabled,
              title: "Sign In",
              titleSize: 16.toFS(),
              onPressed: logic.login,
              color: AppColors.get.primary,
            ),

            SizedBox(height: 32.toH()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText("New to CareDesk?", color: AppColors.get.textSecondary, fontSize: 14),
                TextButton(
                  onPressed: () => NavigationService.instance.replace('/register'),
                  child: CustomText("Create Account", fontWeight: FW.bold, color: AppColors.get.primary, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
