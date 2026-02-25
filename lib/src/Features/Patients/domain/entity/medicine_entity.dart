

class MedicineEntity {
  final int id;
  final String name;

  const MedicineEntity({
    required this.id,
    required this.name,
  });

  static const MedicineEntity empty = MedicineEntity(
    id: 0,
    name: '',
  );

  static List<MedicineEntity> get emptyList => [
        MedicineEntity.empty,
        MedicineEntity.empty,
        MedicineEntity.empty,
        MedicineEntity.empty,
      ];
}