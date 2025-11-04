import 'package:getx_base_code/src/Core/Services/QR/interface/qr_interface.dart';
import 'package:getx_base_code/src/Core/Services/QR/qr_enum.dart';

class QrAdapter {
  final QrInterface _resource;
  QrAdapter(this._resource);

  Future<String> scanQr(QrScanType type) async {
    return await _resource.scanQr(type);
  }
}
