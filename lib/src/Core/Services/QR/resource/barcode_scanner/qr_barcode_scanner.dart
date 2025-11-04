// import 'package:getx_base_code/src/Core/Services/QR/interface/qr_interface.dart';
// import 'package:getx_base_code/src/Core/Services/QR/qr_enum.dart';
// import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class QrBarcodeScanner implements QrInterface {
//   static final QrBarcodeScanner _instance = QrBarcodeScanner._internal();
//   QrBarcodeScanner._internal();
//   factory QrBarcodeScanner() => _instance;

//   @override
//   Future<String> scanQr(QrScanType type) {
//     switch (type) {
//       case QrScanType.QR:
//         return _scanQRCode(scanMode: ScanMode.QR);
//       case QrScanType.BARCODE:
//         return _scanQRCode(scanMode: ScanMode.BARCODE);
//       default:
//         return _scanQRCode(scanMode: ScanMode.DEFAULT);
//     }
//   }

//   /// returns scanned qr code as a string
//   ///This method depends on [FlutterBarcodeScanner] package
//   /// requires extra steps for Ios configuration
//   Future<String> _scanQRCode({ScanMode scanMode = ScanMode.QR}) async {
//     String scannedQr;

//     ///TODO : add configuration to ios
//     try {
//       scannedQr = await FlutterBarcodeScanner.scanBarcode(
//         "#1196c1",
//         "cancel".toTr(),
//         true,
//         scanMode,
//       );
//     } on PlatformException {
//       throw "Platform Exception was found";
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error in scanning QR is : => $e");
//       }
//       scannedQr = "Failed to get QR Code";
//     }
//     return scannedQr;
//   }
// }
