// import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
// import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/Src/options/image_options.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class ImageLottie extends StatelessWidget {
//   final String url;
//   final ImageOptions? options;
//   const ImageLottie({
//     Key? key,
//     required this.url,
//     this.options,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Transform.scale(
//       scale: options?.scale ?? 1,
//       child: Container(
//         height: (options?.radius ?? options?.height)?.toH(),
//         width: (options?.radius ?? options?.width)?.toW(),
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//           color: options?.backgroundColor,
//           borderRadius: options?.borderRadius,
//           shape: options?.radius != null ? BoxShape.circle : BoxShape.rectangle,
//         ),
//         child: Lottie.asset(
//           url,
//           // width: options?.width,
//           // height: options?.height,
//           fit: options?.fit,
//
//           alignment: options?.alignment ?? Alignment.center,
//         ),
//       ),
//     );
//   }
// }
