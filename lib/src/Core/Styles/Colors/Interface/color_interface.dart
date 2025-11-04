import 'package:flutter/material.dart';

abstract class ColorInterface {
  // TODO 6 : Add Basic Colors here !
  Color get primarySwatch => const Color(0xff3F44DC);

  Color get primary => const Color(0xff48736F);
  Color get redAccent => const Color(0xffEA513F);
  Color get secondRed => const Color(0xffA63916);

  Color get lightPrimary => const Color(0xff0A909B);

  Color get lightCard => const Color(0xffF8F3F8);

  Color get primaryDarker => const Color(0xff4E0049);

  Color get secondary => const Color(0xffF9EBCC);

  Color get third => const Color(0xff9CA0BC);

  Color get lightText => third;

  Color get buttonSecondary => third;

  Color get buttonMain => main;

  Color get icon;

  Color get switchEnabled => const Color(0xff4CD964);

  Color get switchDisabled => const Color(0xffF7F8FA);

  Color get switchBorder => const Color(0xffE5E5E5);

  Color get cardBorder;

  Color get cardFill;

  Color get buttonText => third;

  Color get main;

  Color get black => Colors.black87;

  Color get background;

  Color get tabBar;

  Color get activeBackground;

  Color get orangeLight => const Color(0xffff8216);

  /// Grey Colors
  Color get greyLight => const Color(0xffc8c7cc);
  Color get grey => const Color(0xff666666);
  Color get darkGrey => const Color(0xff525356);
  Color get lighterGrey => const Color(0xffF3F3F5);

  Color get lightPink => const Color(0xffE1D0D6);

  Color get secondaryColor => const Color(0xffFCF5E5);

  Color get opposite;

  /// for disabled item like buttons
  Color get disabled;

  Color get title;

  Color get subTitle => const Color(0xffACB1C0);

  Color get indicatorActive => secondary;

  Color get indicatorInactive => const Color(0xffCCCCCC);

  Color get appbar => main;

  Color get appbarTitle => primaryDarker;
  Color get appBarColorInner;

  Color get shadow;

  Color get white => Colors.white;

  Color get transparent => Colors.transparent;

  Color get red => const Color(0xffFF2C2C);
  Color get error => red;

  Color get caution => const Color(0xffFF2D55);

  Color get green => const Color(0xff38D826);

  Color get amber => const Color(0xffFFB116);

  Color get orange => const Color(0xffFF9113);

  Color get yellow => const Color(0xffFCD732);

  Color get chipFill => main;

  Color get chipBorderSecondary => const Color(0xffDFEDFC);

  Color get chipBorder => const Color(0xff101C43);

  Color get userCircleAvatarFill => primary;

  Color get circleAvatarFill => const Color(0xffEFF7FF);

  Color get circleAvatarOverlay => Colors.white.withOpacity(0.5);

  Color get circleAvatarBorder => Colors.white;

  Color get circleAvatarStackedBorder => const Color(0xff3D4CDB);

  Color get blue => const Color(0xff9DDCEC);

  Color get circleBorder => const Color(0xff939393);

  Color get cardSubTitle => const Color(0xffC2C2C2);

  Color get cardBackGroundAccount => const Color(0xffECECEC);

  Color get cardBorderColor => const Color(0xffC1C1C1);
  Color get primaryLighter => const Color(0xffF8F3F8);

  Color get rateColor => const Color(0xffEDA807);
  Color get dateColor => const Color(0xff8D8D8D);
  Color get tabBarlUnselectedTab => const Color(0xffF7F7F7);
  Color get tabBarlUnselectedLable => const Color(0xff858585);
  Color get searchBar => const Color(0xffBFC1C3);
  Color get filterWord => const Color(0xff666C8E);

  /// changed to grade // or save as image
  Color get bnbSelectedItem => primary;

  Color get bnbUnSelectedItem => const Color(0xff949494);

  Color get onRefreshIndicator;

//<editor-fold desc="Text Field">
  Color get tFFFillColor => Colors.white;

  Color get tTFCursor => const Color(0xff000000);

  Color get tFFInputTitle => const Color(0xff000000);

  Color get tFFInputBackground => Colors.transparent;

  Color get tTFIsRequired => red;

  Color get tTFPrefixColor => const Color(0xffAEAEAE);

  Color get tTFPrefixText => const Color(0xffFEF1F1);

  Color get tTFErrorBorder => Colors.red;

  Color get tTFErrorText => const Color(0xffFF4947);

  Color get tTFErrorTextBcg => const Color(0xffFEF1F1);

  Color get tFFHintTitle => const Color(0xffD0D0D0);

  Color get tTFHintTextBcg => const Color(0xffFEF1F1);

  Color get tFFHeaderTitle => title;

  Color get tFFHeaderBackground => Colors.transparent;

  Color get tFFLabelTitle => title;

  Color get tFFLabelBackground => const Color(0xffBBBDC1);

  Color get tTFBackGround => Colors.transparent;

  Color get tTFActiveBackGround => const Color(0xFFF5F5F5);

  Color get tTFBorder => primary;

  Color get tTFFocusBorder => primary;

  Color get tTFSuffixIcon => const Color(0xff6F7282);

  Color get tTFEnableBorder => const Color(0xffE6E6E6);

  Color get tTFDisableBorder => const Color(0xffBBBDC1);

  Color get tFFSuffixText => const Color(0xffFEF1F1);

//</editor-fold>
}
