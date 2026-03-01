import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

class CardViewImage extends StatelessWidget {
  final PlatformFile file;
  const CardViewImage({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true,
      scaleEnabled: true,
      minScale: 0.5,
      maxScale: 4.0,
      child: Hero(
        tag: file.bytes ?? file.name,
        child: ImageGeneric.memory(
          bytes: file.bytes!,
          options: ImageOptions(
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
