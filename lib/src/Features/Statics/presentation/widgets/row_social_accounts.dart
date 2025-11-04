part of 'static_widgets_imports.dart';

class RowSocialAccounts extends StatelessWidget {
  final ContactInfo? contactInfo;

  const RowSocialAccounts({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (contactInfo?.twitter != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.twitter,
                options: ImageOptions(
                  width: 40.toW(),
                  height: 40.toH(),
                )),
            onTap: () {
              LauncherServices.instance
                  .launchToSite(contactInfo?.twitter ?? "");
            },
          ),
          12.ESW(),
        ],
        if (contactInfo?.tikTok != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.tikTok,
                options: ImageOptions(
                  width: 40.toW(),
                  height: 40.toH(),
                )),
            onTap: () {
              LauncherServices.instance.launchToSite(contactInfo?.tikTok ?? "");
            },
          ),
          12.ESW(),
        ],
        if (contactInfo?.whatsApp != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.whatsappIcon,
                options: ImageOptions(
                  backgroundColor: Colors.teal.withOpacity(0.1),
                  width: 35.toW(),
                  height: 35.toH(),
                  //color: Colors.teal,
                )),
            onTap: () async {
              LauncherServices.instance
                  .launchToSite(contactInfo?.whatsApp ?? "");
              // final link = WhatsAppUnilink(
              //   phoneNumber: '+${contactInfo?.whatsApp ?? ""}',
              //   text: "",
              // );
              // await ('$link');
            },
          ),
          12.ESW(),
        ],
        if (contactInfo?.youtube != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.youtube,
                options: ImageOptions(
                  width: 40.toW(),
                  height: 40.toH(),
                )),
            onTap: () {
              LauncherServices.instance
                  .launchToSite(contactInfo?.youtube ?? "");
            },
          ),
          12.ESW(),
        ],
        if (contactInfo?.instagram != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.instagram,
                options: ImageOptions(
                  width: 40.toW(),
                  height: 40.toH(),
                )),
            onTap: () {
              LauncherServices.instance
                  .launchToSite(contactInfo?.instagram ?? "");
            },
          )
        ],
        // 12.ESW(),
        if (contactInfo?.facebook != null) ...[
          GestureDetector(
            child: ImageGeneric.asset(
                url: AppIcons.facebook,
                options: ImageOptions(
                  width: 40.toW(),
                  height: 40.toH(),
                )),
            onTap: () {
              LauncherServices.instance
                  .launchToSite(contactInfo?.facebook ?? "");
            },
          ),
          12.ESW(),
        ],
      ],
    );
  }
}
