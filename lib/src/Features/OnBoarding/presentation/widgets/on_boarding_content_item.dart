part of 'imports_widgets_onboarding.dart';

class OnBoardingScreenContentItem extends StatelessWidget {
  final String image;
  final String title;
  final String body;

  const OnBoardingScreenContentItem({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 440.toH(),
          width: double.infinity,
          child: ImageGeneric.asset(
            url: image,
            options: const ImageOptions(
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: 14.0.toH(), horizontal: 20.toW()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title,
                fontSize: 16,
                fontWeight: FW.semiBold,
                textAlign: TextAlign.center,
              ),
              10.ESH(),
              CustomText.subtitle(
                body,
                fontSize: 14,
                padding: EdgeInsets.symmetric(horizontal: 20.toW()),
                fontWeight: FW.regular,
                textAlign: TextAlign.center,
                // fontWeight: FW.LIGHT,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
