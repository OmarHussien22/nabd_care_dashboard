import 'package:care_desk/src/Core/Services/QR/qr_enum.dart';

abstract class QrInterface {
  Future<String> scanQr(QrScanType type);
}
