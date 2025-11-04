import '../../../../Core/Constants/Strings/Assets/app_onboarding.dart';
import 'onboarding_model.dart';

const String _dumbData = '';
// "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ...";

class OnBoardingData {
  OnBoardingData._();

  static final List<OnBoardingModel> _displayedList = [
    OnBoardingModel(
      id: 1,
      title: 'onBoarding_title_1',
      body: _dumbData,
      imageUrl: AppOnBoarding.onBoarding1,
    ),
    OnBoardingModel(
      id: 2,
      title: 'onBoarding_title_2',
      body: _dumbData,
      imageUrl: AppOnBoarding.onBoarding2,
    ),
    OnBoardingModel(
      id: 3,
      title: 'onBoarding_title_3',
      body: _dumbData,
      imageUrl: AppOnBoarding.onBoarding3,
    ),
  ];
  static List<OnBoardingModel> get displayedList => _displayedList;
}
