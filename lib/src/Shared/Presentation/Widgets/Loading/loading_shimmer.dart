import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const _baseColor = Color(0xffE0E0E0);
const _baseDarkColor = Color(0xff242323);
const _highlightColor = Color(0xd7ffffff);
const _highlightDarkColor = Color(0xffa8b1b1);

class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final bool isDark;
  const CustomShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.isDark = false,
    this.shapeBorder = const CircleBorder(),
  });

  const CustomShimmerWidget.rectangle({
    super.key,
    required this.width,
    required this.height,
    this.isDark = false,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark ? _baseDarkColor : _baseColor,
      highlightColor: isDark ? _highlightDarkColor : _highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: isDark ? _highlightDarkColor : _highlightColor,
        ),
      ),
    );
  }
}

class CustomBuildShimmerLoading extends StatelessWidget {
  const CustomBuildShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.toW()),
      child: Row(
        children: [
          CustomShimmerWidget.circular(
            height: 64.toH(),
            width: 64.toW(),
          ),
          10.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmerWidget.rectangle(
                  height: 10.toH(),
                  width: 140.toW(),
                ),
                8.ESH(),
                CustomShimmerWidget.rectangle(
                  height: 8.toH(),
                  width: double.infinity,
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     children: [
          //       CustomShimmerWidget.rectangle(
          //         height: 12.toH(),
          //         width: 35.toW(),
          //       ),
          //       8.ESH(),
          //       CustomShimmerWidget.rectangle(
          //         height: 12.toH(),
          //         width: 35.toW(),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
