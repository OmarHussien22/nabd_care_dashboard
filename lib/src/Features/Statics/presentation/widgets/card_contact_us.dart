part of 'static_widgets_imports.dart';

class CardContactUs extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const CardContactUs({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageGeneric.asset(
            url: imageUrl,
            options: ImageOptions(
              width: 16.toW(),
              height: 16.toH(),
            ),
          ),
          10.ESW(),
          CustomText(
            title,
            fontSize: 14,
            fontWeight: FW.normal,
            isOverFlow: true,
            maxLines: 1,
            color: AppColors.get.subTitle,
          ),
          //const Spacer(),
          10.ESW(),
          Expanded(
            child: CustomText(
              subTitle,
              fontSize: 13,
              fontWeight: FW.regular,
              color: AppColors.get.black,
              // decoration: CustomTextDecoration.underLine,
            ),
          ),
        ],
      ),
    );
  }
}
