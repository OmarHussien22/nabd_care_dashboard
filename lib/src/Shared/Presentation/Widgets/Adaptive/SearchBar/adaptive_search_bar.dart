import 'package:getx_base_code/src/Core/Constants/strings/app_strings.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Reviewed
double _borderRadius = 12.toRad();

double _borderWidth = 1.toW();

/// TO DO LATER ***************************************
// Color _filledColor = AppColors.kCTFBackGround;
// Color _enableBorder = AppColors.kCTFEnableBorder;
// Color _disableBorder = AppColors.kCTFDisableBorder;
// Color _focusBorder = AppColors.kCTFFocusBorder;
/// TO DO LATER ***************************************
Color _filledColor = Colors.black;
Color _enableBorder = Colors.black;
Color _disableBorder = Colors.black;
Color _focusBorder = Colors.black;

class AdaptiveSearchBar extends StatelessWidget {
  final String? hintLabel;

  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final bool isFilled;

  final double? height;
  final EdgeInsets? padding;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const AdaptiveSearchBar({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.hintLabel,
    this.isFilled = false,
    this.height,
    this.padding,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    late Widget builtWidget;
    bool isDark = false;
    // final isDark = AppController.isDark;
    switch (getOS) {
      case ("ios"):
        builtWidget = SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.045,
          child: CupertinoSearchTextField(
            padding:
                EdgeInsets.symmetric(vertical: 10.toH(), horizontal: 5.toW()),
            controller: controller,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.toFS(),
                ),
            itemColor: !isDark ? Colors.black38 : Colors.white38,
            itemSize: 24.toRad(),
            placeholder: "  ${(hintLabel ?? 'search_anything').tr}",
            decoration: BoxDecoration(
              color: AppColors.get.main,
              boxShadow: [
                BoxShadow(
                  color: AppColors.get.shadow,
                  blurRadius: 1,
                  spreadRadius: 0.1,
                ),
              ],
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            onSubmitted: onSubmitted,
            onChanged: onChanged,
          ),
        );
        break;
      default:
        builtWidget = SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.045,
          child: TextFormField(
            onChanged: onChanged,
            style: Theme.of(context).textTheme.titleMedium,
            controller: controller,
            onFieldSubmitted: onSubmitted,
            // onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.0.toW(), vertical: 4.toH()),

              filled: isFilled,
              hintText: hintLabel ?? 'search_anything'.tr,
              hintStyle: TextStyle(
                color: isDark ? Colors.white38 : Colors.black38,
                fontSize: 14.toFS(),
              ),
              fillColor: isDark ? Colors.white10 : _filledColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _enableBorder,
                  width: _borderWidth,
                  //style: BorderStyle.solid,
                ),
              ),

              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _disableBorder,
                  width: _borderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _enableBorder,
                  width: _borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _focusBorder,
                  width: _borderWidth,
                ),
              ),

              // border:OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              //   borderSide: BorderSide.none,
              // ),

              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              suffix: TextButton(
                child: CustomText.subtitle(
                  'clear'.tr,
                  isUpperCase: true,
                  color: AppColors.get.primary,
                ),
                onPressed: () {
                  controller.clear();
                  onClear!();
                },
              ),
            ),
          ),
        );
        break;
    }
    return Padding(
      padding: padding ??
          EdgeInsetsDirectional.only(
              start: 8.0.toW(), end: 8.0.toW(), bottom: 8.0.toH()),
      child: SafeArea(
        child: builtWidget,
      ),
    );
  }
}
