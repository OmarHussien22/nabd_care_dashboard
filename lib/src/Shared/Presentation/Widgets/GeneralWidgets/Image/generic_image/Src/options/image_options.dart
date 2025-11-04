  import 'package:flutter/material.dart';


class ImageOptions {
  final double? width;
  final double? height;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Color? backgroundColor;
  final String ? onNetworkErrorImage;
  final bool previewImage;
  final double ?previewImageMaxScale;
  final double? previewImageMinScale;
  final double scale ;
  // final bool isCircle;


  const ImageOptions({
    this.width,
    this.height,
    this.fit,
    this.alignment,
    this.color,
    this.backgroundColor,
    this.radius,
    this.borderRadius,
    this.onNetworkErrorImage   ,
    this.previewImage = false,
    this.previewImageMaxScale,
    this.previewImageMinScale,
    this.scale = 1,
    });


}

// class ImageSecondaryOptions {
//
// }
