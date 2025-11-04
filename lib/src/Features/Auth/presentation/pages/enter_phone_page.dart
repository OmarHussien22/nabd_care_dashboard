part of 'auth_pages_imports.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendVerificationCodeController());
    return Scaffold(
      appBar: AppBars.basic(title: "forget_password", isBack: true),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: SingleChildScrollView(
          child: GetBuilder<SendVerificationCodeController>(
            builder: (cnt) {
              return Form(
                key: cnt.globalKey,
                child: Column(
                  children: [
                    const AuthHeader(
                      title: "forget_password",
                      subTitle: "check_phone_tip",
                    ),
                    35.ESH(),
                    PhoneFormField(controller: cnt.phoneController),
                    129.ESH(),
                    ButtonDefault(
                      title: "send_code",
                      height: 56.toH(),
                      titleSize: 16,
                      isDisabled: cnt.isButtonDisabled,
                      onPressed: cnt.sendVerificationCode,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
