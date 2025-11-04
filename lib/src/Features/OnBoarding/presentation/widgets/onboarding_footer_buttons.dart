part of 'imports_widgets_onboarding.dart';

class OnBoardingFooterButtons extends StatelessWidget {
  final OnBoardingController controller;

  const OnBoardingFooterButtons({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ButtonDefault(
            height: 54.toH(),
            backgroundColor: AppColors.get.primary,
            child: CustomText(
              controller.isLastPage ? 'get_started'.toTr() : 'next'.toTr(),
              isUpperCase: true,
              color: Colors.white,
            ),
            onPressed: () {
              controller.onNextChanged();

              /// go to loginScreen
            },
          ),
          20.ESH(),
        ],
      ),
    );
  }
}
