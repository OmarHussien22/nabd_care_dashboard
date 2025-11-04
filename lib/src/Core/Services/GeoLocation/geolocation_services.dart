// import 'dart:io';

// import 'package:getx_base_code/src/Core/Services/Storage/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_api_availability/google_api_availability.dart';
// import 'package:location/location.dart' as loc;

// enum LocationRefusedReason {
//   permissionDenied,
//   permissionDeniedForEver,
//   locationOff,
//   unKnown
// }

// class LocationResponse {
//   final bool status;
//   final Position? position;
//   final LocationRefusedReason? reason;
//   LocationResponse({this.status = false, this.position, this.reason});
// }

// class GeolocationServices {
//   GeolocationServices._();
//   static GeolocationServices get instance => GeolocationServices._();

//   StorageService box = StorageService<bool>();

//   Future<LocationResponse>? determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     GooglePlayServicesAvailability availability;
//     if (Platform.isAndroid) {
//       availability = await GoogleApiAvailability.instance
//           .checkGooglePlayServicesAvailability();
//       box.save("google_available", value: (availability.value == 0));
//     } else {
//       box.save("google_available", value: true);
//     }

//     debugPrint("value : ${box.read("google_available")}");

//     // if(box.read("google_available")){
//     debugPrint("step1");
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       debugPrint("step2");
//       _checkGps();
//       // return LocationResponse(status: false,reason: LocationRefusedReason.locationOff);
//       permission = await Geolocator.checkPermission();
//     }

//     permission = await Geolocator.checkPermission();
//     debugPrint("step3");
//     if (permission == LocationPermission.denied) {
//       debugPrint("step4");
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         debugPrint("step5");
//         return LocationResponse(
//             status: false, reason: LocationRefusedReason.permissionDenied);
//         // permission = await Geolocator.checkPermission();
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       debugPrint("step6");
//       // Permissions are denied forever, handle appropriately.
//       return LocationResponse(
//           status: false, reason: LocationRefusedReason.permissionDeniedForEver);
//       // permission = await Geolocator.checkPermission();
//     }
//     debugPrint("step7");
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     try {
//       var data = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       return LocationResponse(status: true, position: data);
//     } catch (e) {
//       debugPrint("an error occur in location $e");
//       return LocationResponse(
//           status: false, reason: LocationRefusedReason.unKnown);
//     }
//     //
//     // }else{
//     //   return null!;
//     // }
//   }

//   loc.Location location = loc.Location(); //explicit reference to the Location class
//   Future _checkGps() async {
//     if (!await location.serviceEnabled()) {
//       location.requestService();
//     }
//   }

//   // From coordinates
//   Future<Placemark?> positionToAddress(double lat, double lon) async {
//     // String currentAddress="";
//     Placemark? place;
//     try {
//       List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);

//       place = placeMarks[0];

//       // currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
//     } catch (e) {
//       debugPrint("error in translating position to address $e");
//     }

//     return place;
//   }

//   Future<Location?> addressToPosition(String name) async {
//     // List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
//     try {
//       List<Location> locations = await locationFromAddress(name);
//       return locations.first;
//     } catch (e) {
//       debugPrint("error in translating address to position $e");
//     }
//   }
// }
