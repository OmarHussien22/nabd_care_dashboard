part of'static_widgets_imports.dart';
class HelpCenterBottomAppBar extends StatelessWidget {
  const HelpCenterBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.ESH(),
        CustomText(
          'tell_us_how_we_can_help_you',
          fontSize: 24,
          fontWeight: FW.medium,
          color: AppColors.get.white,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.toW(),
            vertical: 32.toH(),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.get.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFieldDefault(
              prefix: PrefixWithIconImage(
                iconImage: AppIcons.search,
              ),
              hint: const TFFHint(
                title: 'search_here',
              ),
              inputDecoration: InputDecorationWithOutBorder(
                filledColor: AppColors.get.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}