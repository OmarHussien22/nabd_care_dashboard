class ExtractString {
  static String getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';

    final names = fullName.trim().split(' ');

    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }

    return '${names[0][0]}${names[1][0]}'.toUpperCase();
  }
}