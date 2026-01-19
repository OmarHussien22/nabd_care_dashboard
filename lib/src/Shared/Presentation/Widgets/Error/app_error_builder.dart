import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Builders/conditional_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Illustrations/imports_illustrations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppErrorBuilder extends StatelessWidget {
  final FlutterErrorDetails details;

  const AppErrorBuilder(
    this.details, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: kReleaseMode,
      onBuild: const IllustrationSomethingWrongScreen(),
      onFeedBack: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(
              details.exception.toString(),
              fontWeight: FW.semiBold,
              fontSize: 16,
            ),
            16.0.ESH(),
            CustomText.subtitle(
              details.exceptionAsString(),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              fontSize: 13,
              fontWeight: FW.light,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
