// import 'package:in_app_review/in_app_review.dart';

// import '../../Constants/Strings/app_strings.dart';

// class AppRateService {
//   AppRateService._();

//   static AppRateService get instance => AppRateService._();

//   Future<void> popUp() async {
//     final InAppReview inAppReview = InAppReview.instance;

//     if (await inAppReview.isAvailable()) {
//       inAppReview.requestReview();
//     }
//   }

//   Future<void> openStore() async {
//     final InAppReview inAppReview = InAppReview.instance;

//     inAppReview.openStoreListing(
//       appStoreId: AppStrings.appStoreID,
//     );
//   }
// }
