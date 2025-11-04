part of 'static_pages_imports.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.basic(
        isBack: true,
        title: 'terms_and_conditions',
        isTitleBold: true,
      ),
      body: GetBuilder<FetchConditionsController>(
        init: FetchConditionsController(),
        builder: (cnt) {
          return Padding(
            padding: AppInsets.defaultScreenALL,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const CustomText(
                  //   "terms_and_conditions",
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
