part of 'static_widgets_imports.dart';

class ContactUsBuilder extends StatelessWidget {
  final ContactInfo contactInfo;
  const ContactUsBuilder({
    super.key,
    required this.contactInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.toH(), horizontal: 16.toW()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            "or_contact_by",
            fontSize: 14,
            fontWeight: FW.medium,
          ),
          24.ESH(),
          CardContactUs(
            imageUrl: AppIcons.phone,
            title: 'mobile : ',
            subTitle: contactInfo.phone ?? "",
            onTap: () {
              LauncherServices.instance.launchToPhone(
                contactInfo.phone ?? "",
              );
            },
          ),
          const AppDivider(),
          CardContactUs(
            imageUrl: AppIcons.whatsapp,
            title: 'whatapp_number : ',
            subTitle: contactInfo.whatsApp ?? "",
            onTap: () {
              LauncherServices.instance.launchToWhatsApp(
                contactInfo.whatsApp ?? "",
              );
            },
          ),
        ],
      ),
    );
  }
}
