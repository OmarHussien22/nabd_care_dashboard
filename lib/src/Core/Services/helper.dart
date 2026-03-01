import 'package:care_desk/src/Core/Services/ImageCropper/image_cropper.dart';
import 'package:care_desk/src/Core/Services/Launcher/launcher_service.dart';
import 'package:care_desk/src/Core/Services/MediaPicker/media_size_handler.dart';
import 'package:care_desk/src/Core/Services/NetworkConnection/network_service.dart';
import 'package:care_desk/src/Core/Services/download/download_service.dart';

import 'MediaPicker/imports_media_picker.dart';

/// A place where you have access to all services .
class Helper {
  Helper._();
  // static LocalAudioService localAudio = LocalAudioService.instance;

  static NetworkConnectionService connectivity =
      NetworkConnectionService.instance;

  // static GeolocationServices location = GeolocationServices.instance;

  static LauncherServices launcher = LauncherServices.instance;

  static MediaPickerService media = MediaPickerService.instance;

  static MediaSizeHandler mediaSizeHandler = MediaSizeHandler.instance;

  static DownloadService downloadService = DownloadService.instance;

  // static QrService qr = QrService();

  // static MapStyleService mapStyle = MapStyleService.instance;

  // static ShareService share = ShareService.instance;

  // static AppRateService appRare = AppRateService.instance;

  static ImageCropperService imageCropper = ImageCropperService.instance;

  // static FlutterBluetoothService bluetooth = FlutterBluetoothService.instance;

  // static ScreenShotService  screenShot = ScreenShotService.instance;
}
