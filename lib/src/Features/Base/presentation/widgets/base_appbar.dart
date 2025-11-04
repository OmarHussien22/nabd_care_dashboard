part of 'imports_widgets_base.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool hasLogo;
  final String? title;

  const BaseAppBar({
    super.key,
    this.title,
    // this.hasLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.get.transparent,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration:  BoxDecoration(
            color: AppColors.get.primary,
            image:  DecorationImage(
              image: AssetImage(
                AppImages.appBarBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      leading: title != null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 6.toH()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomText(
                      title ?? "",
                      fontSize: 14,
                      maxLines: 1,
                      fontWeight: FW.regular,
                      padding: EdgeInsets.symmetric(horizontal: 16.toW()),
                      color: AppColors.get.white,
                    ),
                  ),
                  CustomText(
                    "بتدور على ايه؟",
                    fontSize: 12,
                    fontWeight: FW.regular,
                    padding: EdgeInsets.symmetric(horizontal: 16.toW()),
                    color: AppColors.get.white,
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(right: 3.toW()),
              child: const Text(""),
            ),
      leadingWidth: 1000.toW(),
      // toolbarHeight: 70.toH(),
      actions: [
        // GestureDetector(
        //   onTap: () {
        //     // Get.put(SearchController());
        //     // showSearch(
        //     //   context: context,
        //     //   delegate: SearchPage(),
        //     // );
        //
        //     // Get.to(() => const SearchPage());
        //   },
        //   child: Container(
        //     padding: EdgeInsetsDirectional.only(end: 8.toW(), start: 16.toW()),
        //     child: ImageGeneric.asset(
        //       url: AppIcons.search,
        //       options: ImageOptions(
        //         fit: BoxFit.contain,
        //         height: 22.toH(),
        //         width: 22.toW(),
        //       ),
        //     ),
        //   ),
        // ),
        const ButtonNotification(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity.toW(), 70.toH());
}
