part of 'imports_constants.dart';

extension RouterExtension on BuildContext {
  Object?  get arguments => ModalRoute.of(this)?.settings.arguments;
}


