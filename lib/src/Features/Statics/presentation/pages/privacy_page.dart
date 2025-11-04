part of 'static_pages_imports.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.basic(
        title: 'privacy_policy',
        isBack: true,
        isTitleBold: true,
      ),
      body: GetBuilder<FetchPrivacyController>(
        init: FetchPrivacyController(),
        builder: (cnt) {
          return Padding(
            padding: AppInsets.defaultScreenALL,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const CustomText(
                  //   "privacy_policy",
                  //   fontWeight: FW.semiBold,
                  // ),
                  24.ESH(),
                  DataStatusBuilder(
                    status: cnt.state,
                    onDoneBuild: (cnt.state.data == null)
                        ? Center(
                            child: IllustrationPageBuilder(
                              imageUrl: AppImages.empty,
                              title: "no_data_title".toTr(),
                              body: "no_data_body".toTr(),
                              showRedirectIcon: false,
                            ),
                          )
                        : HtmlWidget(cnt.state.data ?? ""),
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
