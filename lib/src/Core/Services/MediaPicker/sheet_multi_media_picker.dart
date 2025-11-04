part of 'imports_media_picker.dart';

class SheetMultiMediaPicker extends StatefulWidget {
  final VoidCallback? onSingleSelect;
  final VoidCallback ?onMultiSelect;

  const SheetMultiMediaPicker({
    super.key,
      this.onSingleSelect,
      this.onMultiSelect,
  });

  @override
  State<SheetMultiMediaPicker> createState() => _SheetMultiMediaPickerState();
}

class _SheetMultiMediaPickerState extends State<SheetMultiMediaPicker> {
  List<File> pickedImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SheetIndicator(),
        ListTile(
          onTap: () {

                widget.onMultiSelect?.call();


          },
          leading: const Icon(Icons.image_rounded),
          title: CustomText.subtitle("multiple_images".toTr()),
        ),
        ListTile(
          onTap: () {

              widget.onSingleSelect?.call();

          },
          leading: const Icon(Icons.camera_rounded),
          title: CustomText.subtitle("single_image".toTr()),
        ),
      ],
    );
  }
}
