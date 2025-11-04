part of 'splash_imports.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: _splashBCGColor,
      body: Container(
        decoration: BoxDecoration(color: AppColors.get.primary),
        child: Center(
          child: AnimatedContainer(
            duration: _splashDuration,
            child: GetBuilder<SplashController>(
              init: splashController,
              builder: (cnt) => ImageGeneric.asset(
               url:  AppBasicIcons.splashLogo,
                options: ImageOptions(
                 height: cnt.animation.value * _logoHeight ?? 100,
                width: cnt.animation.value * _logoWidth ?? 100,
                // width: double.infinity,
                fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
