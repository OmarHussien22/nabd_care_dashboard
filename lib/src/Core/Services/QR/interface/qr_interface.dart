import 'package:getx_base_code/src/Core/Services/QR/qr_enum.dart';

abstract class QrInterface {
  Future<String> scanQr(QrScanType type);
}
