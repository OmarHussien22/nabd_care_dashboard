part of 'imports_text_options.dart';
FontWeight customTextFw(FW fw) {
  FontWeight fontWeight;
  switch (fw) {
    case FW.heavy:
      fontWeight = FontWeight.w900;
      break;
    case FW.bold:
      fontWeight = FontWeight.bold;
      break;
    case FW.semiBold:
      fontWeight = FontWeight.w600;
      break;
    case FW.normal:
      fontWeight = FontWeight.normal;
      break;
    case FW.medium:
      fontWeight = FontWeight.w500;
      break;
    case FW.regular:
      fontWeight = FontWeight.w400;
      break;
    case FW.light:
      fontWeight = FontWeight.w300;
      break;
    case FW.extraLight:
      fontWeight = FontWeight.w200;
      break;
    case FW.thin:
      fontWeight = FontWeight.w100;
      break;
  }
  return fontWeight;
}
