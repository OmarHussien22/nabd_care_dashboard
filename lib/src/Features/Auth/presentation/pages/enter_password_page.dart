// part of 'imports_auth.dart';
//
// class EnterPasswordPage extends StatelessWidget {
//   final User? user;
//
//   const EnterPasswordPage({
//     super.key,
//     this.user,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Scaffold(
//       appBar: AppBars.logo(
//         isBack: false,
//       ),
//       body: GetBuilder<LoginController>(
//         init: controller,
//         builder: (_) {
//           return Padding(
//             padding: AppInsets.defaultScreenALL,
//             child: Form(
//               key: _.globalKey,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView(
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         14.ESH(),
//                         AuthHeader(
//                           title: UserController.get.user?.name != null &&
//                                   UserController.get.user?.name?.isNotEmpty ==
//                                       true
//                               ? "welcome_user".toTr(namedArgs: {
//                                   "name":
//                                       (UserController.get.user)!.name.notNull
//                                 })
//                               : "welcome",
//                           subTitle: "login_hint",
//                         ),
//                         45.ESH(),
//                         TextFieldDefault(
//                           keyboardType: TextInputType.visiblePassword,
//                           prefix: PrefixWithIconImage(
//                             iconImage: Assets.lock,
//                             color: AppColors.get.black,
//                             scale: 1.5,
//                           ),
//
//                           hint: TFFHint(
//                             title: 'password'.toTr(),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           // header: TFFHeader(title: 'password'.toTr()),
//                           validation: PasswordValidator.instance.validate,
//                           secureType: SecureType.Toggle,
//                           controller: _.passwordController,
//                           onComplete: () {
//                             _.node?.unfocus();
//                           },
//                         ),
//                         32.ESH(),
//                         CustomRoundedButton(
//                           height: 54.toH(),
//                           title: "enter",
//                           onPressed: _.login,
//                         ),
//                         17.ESH(),
//
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomText.subtitle(
//                               "forget_password",
//                               fontSize: 14,
//                               fontWeight: FW.regular,
//                             ),
//                             3.SW(),
//                             InkWell(
//                               onTap: () {
//                                 // Get.to(const CheckPhonePage());
//                               },
//                               child: CustomText.subtitle(
//                                 "reset_password",
//                                 fontSize: 14,
//                                 fontWeight: FW.regular,
//                                 color: AppColors.get.primary,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // 124.ESH(),
//
//                         // 160.ESH(),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     CustomText(
//                         //       "new_user",
//                         //       fontWeight: FW.regular,
//                         //       fontSize: 16,
//                         //       color: AppColors.get.title,
//                         //     ),
//                         //     9.SW(),
//                         //     InkWell(
//                         //       onTap: () {
//                         //         Get.to(const RegisterPage());
//                         //       },
//                         //       child: CustomText(
//                         //         "create_account",
//                         //         color: AppColors.get.primary,
//                         //       ),
//                         //     ),
//                         //   ],
//                         // )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       // body: Padding(
//       //   padding: AppInsets.defaultScreenALL,
//       //   child: SingleChildScrollView(
//       //     child: GetBuilder<CheckPhoneController>(
//       //       builder: (_) {
//       //         return Form(
//       //           key: _.globalKey,
//       //           child: Column(
//       //             children: [
//       //               const AuthHeader(
//       //                 title: "forget_password",
//       //                 subTitle: "check_phone_tip",
//       //               ),
//       //               35.ESH(),
//       //               TextFieldDefault(
//       //                 controller: _.phoneController,
//       //                 header: TFFHeader(
//       //                     title: "phone_number".toTr(),
//       //                     fontSize: 14,
//       //                     fontWeight: FontWeight.w500),
//       //                 prefix: PrefixWithIconImage(
//       //                     iconImage: Assets.phone,
//       //                     color: AppColors.get.black,
//       //                     scale: 1.5),
//       //                 inputDecoration: InputDecorationWithBorder(
//       //                   borderColor: AppColors.get.tTFDisableBorder,
//       //                   disableBorderColor: AppColors.get.tTFDisableBorder,
//       //                 ),
//       //                 hint: TFFHint(
//       //                   fontSize: 14,
//       //                   fontWeight: FontWeight.w600,
//       //                   title: 'phone_number'.toTr(),
//       //                 ),
//       //                 // header: TFFHeader(title: 'password'.toTr()),
//       //               ),
//       //               129.ESH(),
//       //               ButtonDefault(
//       //                 title: "send_code",
//       //                 titleSize: 16,
//       //                 onTap: () {
//       //                   _.checkPhone();
//       //                 },
//       //                 radius: 15,
//       //               ),
//       //             ],
//       //           ),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
