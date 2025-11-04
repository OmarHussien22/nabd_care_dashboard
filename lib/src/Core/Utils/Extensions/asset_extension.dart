extension AssetUrl on String {
  // ignore: non_constant_identifier_names
  String get toImg {
    return 'assets/images/$this.png';
  }

  String get toIcon {
    return 'assets/icons/$this.png';
  }

  String get toLottie {
    return 'assets/lottie/$this.json';
  }
  String assetAudio({bool isMp3 = false}) {

    return 'assets/audio/$this.${isMp3 ? 'mp3' : 'wav'}';
  }
}
