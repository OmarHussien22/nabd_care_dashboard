class MedicineEntity {
  final int id;
  final String name;

  const MedicineEntity({
    required this.id,
    required this.name,
  });

  // static const MedicineEntity empty = MedicineEntity(
  //   id: 0,
  //   name: '',
  // );

  static List<MedicineEntity> get emptyList => [
        MedicineEntity(id: 1, name: "medicine_1"),
        MedicineEntity(id: 2, name: "medicine_2"),
        MedicineEntity(id: 3, name: "medicine_3"),
        MedicineEntity(id: 4, name: "medicine_4"),
        MedicineEntity(id: 5, name: "medicine_5"),
        MedicineEntity(id: 6, name: "medicine_6"),

      ];
}
