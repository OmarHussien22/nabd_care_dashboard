class MediaSizeHandler {
  MediaSizeHandler._();
  static MediaSizeHandler get instance => MediaSizeHandler._();
   String formatBytes(int bytes) {
    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} KB";
    }
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }

   bool isImage(String name) {
    final ext = name.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(ext);
  }
}