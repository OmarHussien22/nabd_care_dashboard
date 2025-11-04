part of 'imports_customizable.dart';

class ButtonRedirection extends StatelessWidget {
  final String? label;
  final String? imageUrl;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final bool showIcon;
  final bool reverseOrder;
  final double? height;
  const ButtonRedirection({
    super.key,
    this.label,
    this.imageUrl,
    this.padding,
    this.showIcon = true,
    this.reverseOrder = false,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ButtonDefault(
        height:height??40.toH() ,
        backgroundColor: AppColors.get.primary,
        padding: padding,
        onPressed: onPressed,
        child: Directionality(
          textDirection: reverseOrder ? TextDirection.ltr : TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (showIcon) ImageGeneric.asset(imageUrl??Assets.reload,scale: 4,),
              //  XSpace.normal,
              CustomText(
                label ?? '',
                color: Colors.white,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
