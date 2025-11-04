import 'dart:io';
import '../../../../Core/NetworkStructure/Params/params.dart';
import '../../../../Core/Utils/Extensions/basic_op_extensions.dart';

class CompleteDataParams extends Params {
  final String name;
  final double? lat;
  final double? lng;
  final String? address;
  final List<int> services;
  final File? profileImage;
  final List<File?> images;
  final String? about;

  CompleteDataParams({
    required this.name,
    this.lat,
    this.lng,
    this.address,
    required this.services,
    required this.profileImage,
    this.images = const [],
    this.about,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lng': lng,
    'address': address,
      'services': services,
      'profile_image': profileImage,
      if (images.isNotEmpty) 'images': images,
      'about': about,
    }.removeNullValues;
  }
}
