part of 'imports_auth.dart';

class VerificationPage extends StatelessWidget {
  final String? title;
  final String? phone;
  final bool register;
  final Function? onSuccess;

  const VerificationPage({
    super.key,
    required this.phone,
    this.register = true,
    this.onSuccess,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CheckVerificationCodeController());

    return Scaffold(
      appBar: AppBars.basic(title: "confirm_code", isBack: false),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: SingleChildScrollView(
          child: GetBuilder<CheckVerificationCodeController>(
            init: CheckVerificationCodeController(),
            builder: (cnt) {
              return Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.toW()),
                  child: Column(
                    children: [
                      24.ESH(),
                      AuthHeader(
                        title: 'confirm_code',
                        subTitle: '${"confirm_code_hint".toTr()} $phone',
                      ),
                      34.0.ESH(),
                      PinCodeServices.pinCodeWidget(
                        fieldCounts: 6,
                        context: context,
                        textEditingController: cnt.codeController!,
                        errorController: cnt.errorController!,
                      ),
                      32.ESH(),
                      ButtonDefault(
                        borderRadius: 15.toRad(),
                        title: 'confirm',
                        height: 48.toH(),
                        onPressed: () {
                          // _checkCodeController.checkVerificationCode(
                          //   phone: phone!,

                          //   verificationCode: _.textEditingController!.text,
                          //   onSuccess: onSuccess,
                          // );
                          cnt.checkVerificationCode(
                            phone: phone!,
                            onSuccess: onSuccess,
                          );
                        },
                      ),
                      32.ESH(),
                      Center(
                        child: Column(
                          children: [
                            const CustomText(
                              'didnt_receive_code',
                              fontSize: 14,
                              fontWeight: FW.regular,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  '00:${cnt.countDownTimer}',
                                  fontSize: 20,
                                  fontWeight: FW.bold,
                                ),
                                if (cnt.countDownTimer == 0) ...[
                                  16.ESW(),
                                  GestureDetector(
                                    onTap: () {
                                      cnt.resendCode(phone: phone!);
                                    },
                                    child: CustomText(
                                      'resend_code',
                                      fontSize: 16,
                                      fontWeight: FW.bold,
                                      color: AppColors.get.primarySwatch,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      27.8.ESH(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // void submit(BuildContext context) async {
  //   if (verificationController.textEditingController!.text.length == 6) {
  //     try {
  //       await onSuccess!(verificationController.textEditingController!.text);
  //     } catch (e) {
  //       // Get.back();
  //       Get.back();
  //       printDM('error in code verification ${e}');
  //       AppSnacks().showSnack(
  //           title: e.toString().contains(
  //                   "The sms verification code used to create the phone auth credential is invalid")
  //               ? "confirm_code_and_resend".toTr()
  //               : "confirm_code_and_resend33".toTr(),
  //           state: UtilState.error);
  //       // snackBarDefault(
  //       //   // title: 'Error_'.toTr(),
  //       //   errorMessage: true,
  //       //   title:
  //       //   e.toString().contains("The SMS verification code used to create the phone auth credential is invalid")?
  //       //   "confirm_code_and_resend".toTr():
  //       //   "confirm_code_and_resend".toTr(),
  //       // );
  //       printDM(e.toString());
  //     }
  //   }
  // }
}
