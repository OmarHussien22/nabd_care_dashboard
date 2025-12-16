class Doctor {
  final int? id;
  final String name;
  final String specialization;
  final String phone;
  final String? email;

  Doctor({
    this.id,
    required this.name,
    required this.specialization,
    required this.phone,
    this.email,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'phone': phone,
      'email': email,
    };
  }
}
