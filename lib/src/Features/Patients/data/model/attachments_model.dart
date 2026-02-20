import 'package:care_desk/src/Features/Patients/domain/entity/attachments_entity.dart';

class AttachmentsModel extends AttachmentsEntity {
  AttachmentsModel({
    required super.id,
    required super.name,
    required super.url,
  });

  factory AttachmentsModel.fromJson(Map<String, dynamic> json) {
    return AttachmentsModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
