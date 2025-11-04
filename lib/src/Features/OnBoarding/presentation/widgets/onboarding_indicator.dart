part of 'imports_widgets_onboarding.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (cnt) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.toH()),
          child: SmoothPageIndicator(
            controller: cnt.pageController,
            count: cnt.data.length,
            effect: JumpingDotEffect(
              activeDotColor: AppColors.get.secondary,
              dotColor: AppColors.get.secondary.withOpacity(0.3),
              dotHeight: 8.toH(),
              dotWidth: 8.toH(),
            ),
            onDotClicked: cnt.onPageChanged,
          ),
        );
      },
    );
  }
}
