part of 'imports_auth.dart';

class RegisterPage extends StatelessWidget {
  final String? phone;

  const RegisterPage({
    super.key,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {

    final node = FocusScope.of(context);

    Get.put(RegisterUserLocalController());

    return Scaffold(
      backgroundColor: AppColors.get.primary,
      body: GetBuilder<RegisterUserLocalController>(
        builder: (logic) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isWide = constraints.maxWidth > 800;

                return Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20.toW()),
                    child: Container(
                      padding: AppInsets.defaultScreenHorizontal,
                      margin: AppInsets.defaultScreenOnly(
                          left: 18, right: 18, bottom: 30),
                      decoration: BoxDecoration(
                        color: AppColors.get.white,
                        borderRadius: BorderRadius.circular(20.toRad()),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.get.shadow,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isWide
                            ? Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: _RegisterForm(logic: logic, node: node),
                                  ),
                                  const SizedBox(width: 20),
                                  const Expanded(flex: 4, child: _WelcomeSection()),
                                ],
                              )
                            : Column(
                                children: [
                                  const _WelcomeSection(),
                                  SizedBox(height: 20.toH()),
                                  _RegisterForm(logic: logic, node: node),
                                ],
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      key: const ValueKey("RegisterForm"),
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          "register".toTr(),
          fontSize: 9,
          fontWeight: FW.bold,
          color: isDark ? AppColors.get.white : AppColors.get.primary,
        ),
        20.ESH(),
        AppFillTextFieldField(
          controller: logic.nameController,
          hint: "enter_full_name".toTr(),
          header: "user_name".toTr(),
          prefixAsset: AppIcons.user,
          keyboardType: TextInputType.name,
          validation: AppValidator.defaultValidator.validate,
          onComplete: node.nextFocus,
        ),
        10.ESH(),
        AppFillTextFieldField(
          controller: logic.email,
          hint: "enter_email".toTr(),
          header: "email".toTr(),
          prefixAsset: AppIcons.user,
          keyboardType: TextInputType.emailAddress,
          validation: AppValidator.emailValidator.validate,
          onComplete: node.nextFocus,
        ),
        10.ESH(),
        PhoneFormField(
          controller: logic.phoneController,
          hasCountryCode: false,
          onComplete: node.nextFocus,
        ),
        10.ESH(),
        SelectRolesSheet(),
        10.ESH(),
        AppPasswordField(
          controller: logic.passwordController,
          onComplete: node.unfocus,
        ),
        20.ESH(),
        ButtonDefault(
          height: 56.toH(),
          width: double.infinity,
          isDisabled: logic.isButtonDisabled,
          title: "register_now",
          onPressed: logic.register,
        ),
        15.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              "have_account".toTr(),
              color: AppColors.get.title,
              fontWeight: FW.regular,
            ),
            InkWell(
              onTap: () => Get.offAll(const LoginPage(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 300),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CustomText(
                  "login".toTr(),
                  color: AppColors.get.primary,
                  fontWeight: FW.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: const ValueKey("WelcomeSection"),
      height: 400.toH(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.toRad()),
        image: DecorationImage(
          image: AssetImage(AppImages.noImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            isDark ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storefront_rounded,
              size: 64.toW(),
              color: Colors.white.withOpacity(0.9),
            ),
            20.ESH(),
            CustomText(
              "welcome_to_register_page".toTr(),
              fontSize: 10,
              color: Colors.white,
              fontWeight: FW.bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
