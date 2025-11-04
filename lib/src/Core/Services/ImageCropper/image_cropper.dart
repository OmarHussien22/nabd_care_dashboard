import 'dart:io';

import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../Styles/Colors/app_colors.dart';

class ImageCropperService {
  ImageCropperService._();

  static ImageCropperService get instance => ImageCropperService._();

  Future<File?> cropImage(File image) async {
    ImageCropper imageCropper = ImageCropper();
    CroppedFile? croppedImage = await imageCropper.cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'image_selection'.toTr(),
          toolbarColor: AppColors.get.primary,
          toolbarWidgetColor: AppColors.get.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        IOSUiSettings(
          title: 'image_selection'.toTr(),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
      ],
    );
    return croppedImage != null ? File(croppedImage.path) : null;
  }
}
