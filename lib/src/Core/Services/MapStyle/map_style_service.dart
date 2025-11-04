// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapStyleService {
//   MapStyleService._();

//  static MapStyleService get instance => MapStyleService._();

//   static String? _darkMapStyle;
//   static String? _lightMapStyle;

//   /// Must be called in the [initState]
//   static Future loadMapStyles() async {
//     _darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
//     _lightMapStyle =
//         await rootBundle.loadString('assets/map_styles/light.json');
//   }

//   /// Called in the [onMapCreated] after the [mapController] is Completed

//   static Future setMapStyle(GoogleMapController? mapController) async {
//     Completer<GoogleMapController> _controller = Completer();
//     _controller.complete(mapController);
//     final controller = await _controller.future;

//     // if (AppController.isDark) {
//     //   controller.setMapStyle(_darkMapStyle);
//     // } else {
//     //   controller.setMapStyle(_lightMapStyle);
//     // }
//   }
// }
