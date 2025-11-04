import 'package:getx_base_code/src/Core/Services/DynamicLink/HandleNotification/Interfaces/dynamic_link_type.dart';

class GeneralDynamicLink extends DynamicLinkType {
  GeneralDynamicLink._();

  static final GeneralDynamicLink instance = GeneralDynamicLink._();

  @override
  void onDynamicLinkRedirect(String decodedData) {
    // final model = AdvertiseModel.fromMap(decodedData);
    // Snap.offAll(const BasePage());
    //? page which will be opened when user click on dynamic link
    // Snap.to(
    //   AdvertisementDetailsPage(
    //     advertise: model,
    //     isFromDynamicLink: true,
    //   ),
    // );
  }
}
