class ClinicModel {
  int? id;
  int? ownerId;
  String? name;
  String? createdAt;
  String? settings;

  ClinicModel({
    this.id,
    this.ownerId,
    this.name,
    this.createdAt,
    this.settings,
  });

  ClinicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    createdAt = json['created_at'];
    settings = json['settings'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_id': ownerId,
        'name': name,
        'created_at': createdAt,
        'settings': settings,
      };
}
