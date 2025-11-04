part of 'imports_auth.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBars.colored(title: "password", isBack: true),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: GetBuilder<ChangePasswordController>(
          builder: (cnt) {
            return AnimatedWrapper(
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: cnt.globalKey,
                      child: ListView(
                        physics: AppPhysics.bouncingPhysics,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          14.ESH(),
                          const AuthHeader(
                            title: "enter_new_password",
                            subTitle: "enter_new_password_tips",
                          ),
                          30.ESH(),
                          AppPasswordField(
                            headerText: "password_current",
                            controller: cnt.oldPasswordController,
                            isRequired: true,
                          ),
                          25.ESH(),
                          AppPasswordField(
                            headerText: "password_new",
                            controller: cnt.newPasswordController,
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
                                {"password": cnt.newPasswordController.text},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonDefault(
                    title: "save_changes",
                    height: 54.toH(),
                    isDisabled: cnt.isButtonDisabled,
                    width: double.infinity,
                    onPressed: cnt.changePassword,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
