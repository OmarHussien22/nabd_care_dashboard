part of 'imports_auth.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: GetBuilder<RegisterController>(
        builder: (logic) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isWide = screenWidth > 900;
          final formMaxWidth = 520.0;

          final registerForm = _RegisterForm(logic: logic, node: node, maxWidth: formMaxWidth);

          if (!isWide) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColors.get.primary.withOpacity(0.05),
                    AppColors.get.background,
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: registerForm,
                ),
              ),
            );
          }

          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
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
                         // backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        ),
                        child: Icon(
                          Icons.app_registration_rounded,
                          size: 80.toW(),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40.toH()),
                      CustomText(
                        "start_your_journey",
                        fontSize: 32,
                        fontWeight: FW.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.toH()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 64.toW()),
                        child: CustomText(
                          "register_desc",
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
                      child: registerForm,
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

class _RegisterForm extends StatelessWidget {
  final RegisterController logic;
  final FocusScopeNode node;
  final double maxWidth;

  const _RegisterForm({
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
        key: const ValueKey("RegisterForm"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              "create_account",
              fontSize: 24,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
            SizedBox(height: 12.toH()),
            CustomText(
              "register_sub_desc",
              fontSize: 14,
              color: AppColors.get.textSecondary,
            ),
            SizedBox(height: 32.toH()),

            AppFillTextFieldField(
              width: double.infinity,
              controller: logic.nameController,
              hint: "full_name".toTr(),
              header: "display_name".toTr(),
              prefixAsset: AppIcons.user,
              keyboardType: TextInputType.name,
              validation: AppValidator.defaultValidator.validate,
              onComplete: node.nextFocus,
            ),
            SizedBox(height: 20.toH()),

            PhoneFormField(
              width: double.infinity,
              controller: logic.phoneController,
              hasCountryCode: false,
              onComplete: node.nextFocus,
            ),
            SizedBox(height: 20.toH()),

            AppPasswordField(
              width: double.infinity,
              controller: logic.passwordController,
              onComplete: node.unfocus,
            ),
            
            SizedBox(height: 40.toH()),

            ButtonDefault(
              height: 56.toH(),
              width: double.infinity,
              isDisabled: logic.isButtonDisabled,
              title: "create_account",
              titleSize: 16.toFS(),
              onPressed: logic.register,
              color: AppColors.get.primary,
            ),

            SizedBox(height: 32.toH()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText("already_have_account", color: AppColors.get.textSecondary, fontSize: 14),
                TextButton(
                  onPressed: () => NavigationService.instance.replace('/login'),
                  child: CustomText("sign_in", fontWeight: FW.bold, color: AppColors.get.primary, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
