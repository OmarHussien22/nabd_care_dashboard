import 'package:care_desk/src/Core/params/local_params.dart';

class ClinicParams extends LocalParams {
  String name;
  int ownerId;
  String createdAt;
  String? settings;

  ClinicParams({
    required this.name,
    required this.ownerId,
    required this.createdAt,
    this.settings,
  });

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'owner_id': ownerId,
        'created_at': createdAt,
        'settings': settings,
      };
}
