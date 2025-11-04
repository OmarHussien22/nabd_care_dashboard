part of 'imports_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginUserLocalController());
    final node = FocusScope.of(context);
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: AppColors.get.primary,
      body: GetBuilder<LoginUserLocalController>(
        builder: (logic) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(24.toH()),
              padding: EdgeInsets.all(12.toH()),
              decoration: BoxDecoration(
                color: AppColors.get.white,
                borderRadius: BorderRadius.circular(24.toRad()),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.get.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// LEFT SIDE — Login Form
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.toH(),
                        vertical: 24.toH(),
                      ),
                      child: Form(
                        key: logic.globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              "login",
                              fontSize: 10,
                              fontWeight: FW.bold,
                              color: AppColors.get.primary,
                            ),
                            20.ESH(),

                            /// Phone Field
                            PhoneFormField(
                              controller: logic.phoneController,
                              hasCountryCode: false,
                              onComplete: node.nextFocus,
                            ),
                            20.ESH(),

                            /// Password Field
                            AppPasswordField(
                              hint: "password".toTr(),
                              controller: logic.passwordController!,
                              onComplete: () {
                                node.unfocus();
                                logic.login();
                              },
                            ),
                            32.ESH(),

                            /// Login Button
                            ButtonDefault(
                              height: 56.toH(),
                              width: double.infinity,
                              isDisabled: logic.isButtonDisabled,
                              title: "login",
                              onPressed: logic.login,
                            ),
                            20.ESH(),

                            const FooterLogin(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// RIGHT SIDE — Logo & Description
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.toRad()),
                        color: AppColors.get.white,
                      ),
                      padding: EdgeInsets.all(32.toH()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Logo
                          Container(
                            width: isWide ? 180.toH() : 120.toH(),
                            height: isWide ? 180.toH() : 120.toH(),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.get.shadow,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(AppBasicIcons.logo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          24.ESH(),

                          /// Description
                          CustomText(
                            "welcome_to_your_store".toTr(),
                            fontSize: 8,
                            textAlign: TextAlign.center,
                            color: AppColors.get.title,
                          ),
                          8.ESH(),
                          CustomText(
                            "login_to_manage_your_business_easily".toTr(),
                            fontSize: 6.5,
                            textAlign: TextAlign.center,
                            color: AppColors.get.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
