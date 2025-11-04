part of 'imports_customizable.dart';

/// Confirmed

class ButtonBack extends StatelessWidget {
  final Color? color;

  const ButtonBack({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: AppSizes.iconRad.toRad(),
      onPressed: () {
        context.back();
      },
      icon: Container(
        margin: EdgeInsets.all(2.toW()),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.toW()),
          color: AppColors.get.white,
          border: Border.all(
            color: AppColors.get.greyLight,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: color,
          size: AppSizes.iconRad.toRad(),
        ),
      ),
    );
  }
}
