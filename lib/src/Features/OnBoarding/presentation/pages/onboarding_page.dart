part of "imports_onboarding.dart";

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: (cnt) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: PageView.builder(
                    physics: AppPhysics.bouncingPhysics,
                    controller: cnt.pageController,
                    itemCount: cnt.data.length,
                    onPageChanged: (index) => cnt.onPageChanged(index),
                    itemBuilder: (ctx, index) {
                      // _.updatePageIndex(index);
                      return OnBoardingScreenContentItem(
                        image: "${cnt.data[index].imageUrl}",
                        title: "${cnt.data[index].title}",
                        body: "${cnt.data[index].body}",
                      );
                    },
                  ),
                ),
              ),
              const OnBoardingIndicator(),
              OnBoardingFooterButtons(controller: cnt),
            ],
          );
        },
      ),
    );
  }
}
