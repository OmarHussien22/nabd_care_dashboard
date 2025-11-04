part of 'imports_auth.dart';

class ResetPasswordPage extends StatelessWidget {
  final String phone;

  const ResetPasswordPage({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController(phone: phone));
    return Scaffold(
      appBar: AppBars.basic(
        title: "new_password",
        isBack: true,
        arrowBackColor: AppColors.get.black,
      ),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: GetBuilder<ResetPasswordController>(
          builder: (cnt) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: cnt.globalKey,
                      child: Column(
                        children: [
                          14.ESH(),
                          const AuthHeader(
                            title: "new_password",
                            subTitle: "reset_password_tip",
                          ),
                          40.ESH(),
                          AppPasswordField(
                            headerText: "password_new",
                            controller: cnt.passwordController,
                            isRequired: true,
                          ),
                          25.ESH(),
                          AppPasswordField(
                            headerText: "password_confirm",
                            controller: cnt.confirmPasswordController,
                            isRequired: true,
                            validation: (value) {
                              return ConfirmPasswordValidator.instance.validate(
                                value,
                                {"password": cnt.passwordController.text},
                              );
                            },
                          ),
                          24.ESH(),
                          ButtonDefault(
                            title: "save_changes",
                            height: 56.toH(),
                            isDisabled: cnt.isDisabled,
                            width: double.infinity,
                            onPressed: cnt.resetPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
