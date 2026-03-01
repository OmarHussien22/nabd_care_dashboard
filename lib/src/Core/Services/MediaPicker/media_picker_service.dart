part of 'imports_media_picker.dart';

/// Depends on [image_picker] Package

class MediaPickerService {
  MediaPickerService._();

  static MediaPickerService get instance => MediaPickerService._();

  /// returns the picked Image Sheet to choose between [Camera] or [Gallery] and between [single] and [multi] images
  Future<void> pickMediaSheet({
    MediaPickedType type = MediaPickedType.single,
    required Function(File?) onSuccess,
  }) async {
    AppSheets.get.showBottomSheet(
      SheetMediaPicker(
        type: type,
        onCameraPicked: () {
          pickImage(source: ImageSource.camera).then((value) {
            onSuccess.call(value);
            Snap.back();
          });
        },
        onGalleryPicked: () {
          pickImage(source: ImageSource.gallery).then((value) {
            onSuccess.call(value);
            Snap.back();
          });
        },
      ),
    );
  }

  Future<void> pickMultiMediaSheet({
    required Function(List<File?>) onSuccess,
  }) async {
    AppSheets.get.showBottomSheet(
      SheetMultiMediaPicker(
        onMultiSelect: () async {
          final values = await pickImages();
          if (values.isNotEmpty) {
            onSuccess.call(values);
          }
          Snap.back();
        },
        onSingleSelect: () async {
          final value = await pickImage(source: ImageSource.gallery);
          if (value != null) {
            onSuccess.call([value]);
          }
          Snap.back();
        },
      ),
    );
  }

  /// returns the picked Image

  Future<File?> pickImage({
    ImageSource source = ImageSource.camera,
    CameraDevice cameraDevice = CameraDevice.rear,
  }) async {
    File? pickedImage;
    try {
      await ImagePicker()
          .pickImage(
        imageQuality: 10,
        source: source,
        preferredCameraDevice: cameraDevice,
      )
          .then((value) {
        if (value != null) {
          pickedImage = File(value.path);
          if (kDebugMode) {
            print("pickedImage is : $pickedImage");
          }
        }
      }).catchError((e) {
        if (kDebugMode) {
          print("Error in picking image is : $e");
        }
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed To pick an Image Bc of  =>> Platform exception is : $e");
      }
    }
    return pickedImage;
  }

  Future<List<File>> pickImages({
    CameraDevice cameraDevice = CameraDevice.rear,
  }) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> result = await picker.pickMultiImage();
    List<File> files = result.map((e) => File(e.path)).toList();
    return files;
  }

  Future<File?> pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  /// Pick multiple files directly without showing bottom sheet
  /// Works on desktop, web, and mobile
  /// Supports images, videos, PDFs, and other file types
 Future<List<PlatformFile>> pickFilesDirectly({
  List<String>? allowedExtensions,
  bool allowMultiple = true,
  FileType type = FileType.custom,
  Function(FilePickerStatus)? onFileLoading,
}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: type,
      allowMultiple: allowMultiple,
      allowCompression: true,
      withData: true, // مهم للويب
      onFileLoading: onFileLoading,
      allowedExtensions: allowedExtensions ??
          ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'docx', 'mp4', 'mov'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files; // بس كده
    }

    return [];
  } catch (e) {
    if (kDebugMode) {
      print("Error picking files: $e");
    }
    return [];
  }
}
  /// Pick images directly without showing bottom sheet
  /// Uses file_picker instead of image_picker for cross-platform support
  Future<List<PlatformFile>> pickImagesDirectly({
    bool allowMultiple = true,
  }) async {
    return pickFilesDirectly(
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'],
      allowMultiple: allowMultiple,
      type: FileType.custom,
    );
  }

  /// Pick any type of media (images, videos, documents) directly
  Future<List<PlatformFile>> pickMediaDirectly({
    bool allowMultiple = true,
  }) async {
    return pickFilesDirectly(
      type: FileType.media,
      allowMultiple: allowMultiple,
    );
  }
}

enum MediaPickedType { single, multi }
