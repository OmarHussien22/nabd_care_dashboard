part of 'static_pages_imports.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAboutController());
    return Scaffold(
      appBar: AppBars.basic(
        title: "about_app",
        isTitleBold: true,
        elevation: 0.8,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<FetchAboutController>(
          init: FetchAboutController(),
          builder: (cnt) {
            return DataStatusBuilder(
              status: cnt.state,
              onRedirect: () => cnt.fetchAbout(),
              onDoneBuild: (cnt.state.data == null)
                  ? Center(
                      child: IllustrationPageBuilder(
                        imageUrl: AppImages.empty,
                        title: "no_data_title".toTr(),
                        body: "no_data_body".toTr(),
                        showRedirectIcon: false,
                      ),
                    )
                  : AnimatedWrapper(
                      child: Column(
                        children: [
                          Container(
                            height: 200.toH(),
                            width: MediaQuery.sizeOf(context).width,
                            color: AppColors.get.greyLight,
                            child: ImageGeneric.asset(url: AppBasicIcons.logo),
                          ),
                          // Divider(
                          //   height: 30.toH(),
                          //   color: AppColors.get.grey,
                          // ),
                          ListCardFaq(
                            questions: cnt.state.data!.questions ?? [],
                          ),
                          Divider(
                            height: 30.toH(),
                            color: AppColors.get.grey,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Column(
                            children: [
                              // ImageGeneric.asset(
                              //   url: (AppBasicIcons.logo),
                              //   options: ImageOptions(
                              //     width: 173.toW(),
                              //     height: 119.toH(),
                              //   ),
                              // ),
                              // 44.ESH(),
                              // CustomText(
                              //   _.state.data?.description ?? "",
                              //   fontSize: 14,
                              //   color: AppColors.get.grey,
                              //   textAlign: TextAlign.center,
                              // ),
                              16.ESH(),
                              RowSocialAccounts(contactInfo: cnt.state.data),
                              18.ESH(),
                              const CustomText(
                                "ﻛﻞ اﻟﺤﻘﻮق ﻣﺤﻔﻮﻇﺔ ﻟﺘﻄﺒﻴﻖ The way ©",
                                fontSize: 12,
                              ),
                            ],
                          ),

                          20.ESH(),
                          CustomText(
                            cnt.state.data!.description ?? "",
                            fontSize: 12,
                          ),
                          20.ESH(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: const CustomText(
                                  'privacy_policy',
                                  fontSize: 12,
                                ),
                                onTap: () {
                                  Snap.to(const PrivacyPage());
                                },
                              ),
                              5.ESW(),
                              CustomText(
                                '\u2022',
                                fontSize: 12,
                                fontWeight: FW.semiBold,
                                color: AppColors.get.primary,
                              ),
                              5.ESW(),
                              GestureDetector(
                                child: const CustomText(
                                  'terms_and_conditions',
                                  fontSize: 12,
                                ),
                                onTap: () {
                                  Snap.to(const ConditionsPage());
                                },
                              ),
                            ],
                          ),
                          20.ESH(),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
