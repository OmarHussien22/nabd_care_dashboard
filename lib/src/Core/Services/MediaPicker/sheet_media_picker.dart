part of 'imports_media_picker.dart';

class SheetMediaPicker extends StatelessWidget {
  final MediaPickedType type;
  final VoidCallback? onCameraPicked;
  final VoidCallback? onGalleryPicked;

  const SheetMediaPicker({
    super.key,
    this.type = MediaPickedType.single,
    this.onCameraPicked,
    this.onGalleryPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SheetIndicator(),
        ListTile(
          onTap: () {
            onCameraPicked?.call();
          },
          leading: const Icon(Icons.camera_rounded),
          title: CustomText.subtitle("from_camera".toTr()),
        ),
        ListTile(
          onTap: () {
            onGalleryPicked?.call();
          },
          leading: const Icon(Icons.image_outlined),
          title: CustomText.subtitle("from_gallery".toTr()),
        ),
      ],
    );
  }
}
