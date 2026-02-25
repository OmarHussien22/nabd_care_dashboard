class GenderEntity {
  final int id;
  final String name;
  GenderEntity({required this.id, required this.name});

  static List<GenderEntity> getGenderList = [
    GenderEntity(id: 1, name: "male"),
    GenderEntity(id: 2, name: "female"),
  ];

  // static List<String> getGenderListNames = [
  //   "male",
  //   "female",
  // ];
}
