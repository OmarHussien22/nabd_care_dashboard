// import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class BetterPlayerWidget extends StatefulWidget {
//   final String? videoUrl;
//
//   const BetterPlayerWidget({super.key, this.videoUrl});
//
//   @override
//   _BetterPlayerWidgetState createState() => _BetterPlayerWidgetState();
// }
//
// class _BetterPlayerWidgetState extends State<BetterPlayerWidget> {
//   late BetterPlayerController _betterPlayerController;
//
//   @override
//   void initState() {
//     super.initState();
//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
//       // "https://azcourses.net/uploads/1663595515.mp4"
//       // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
//       widget.videoUrl ?? '',
//     );
//     _betterPlayerController = BetterPlayerController(
//       BetterPlayerConfiguration(
//         aspectRatio: 16 / 9,
//         // showPlaceholderUntilPlay: true,
//         placeholder: Container(color: Colors.white),
//
//         errorBuilder: (context, errorMessage) => Text(
//           errorMessage!,
//           style: TextStyle(color: Colors.red),
//         ),
//       ),
//       betterPlayerDataSource: betterPlayerDataSource,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.videoUrl != null
//         ? Stack(
//             children: [
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: BetterPlayer(
//                     controller: _betterPlayerController,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         : const AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Placeholder(),
//             // child: Image.asset(
//             //  Assets.VideoTest,
//             //   fit: BoxFit.cover,
//             // ),
//           );
//   }
// }
