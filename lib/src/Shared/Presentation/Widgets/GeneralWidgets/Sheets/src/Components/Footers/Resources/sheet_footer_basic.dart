import 'package:flutter/material.dart';

import '../../../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Buttons/Basic/button_default.dart';
import '../../../../../Buttons/Basic/custom_rounded_button.dart';

class SheetFooterBasic extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const SheetFooterBasic({
    super.key,
    this.title = 'save',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0.toW(), vertical: 16.0.toH()),
      child: ButtonDefault(
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}
