class DiseaseEntity {
  final int id;
  final String name;

  const DiseaseEntity({
    required this.id,
    required this.name,
  });

  static const DiseaseEntity empty = DiseaseEntity(
    id: 0,
    name: '',
  );

  static List<DiseaseEntity> get emptyList => [
        DiseaseEntity.empty,
        DiseaseEntity.empty,
        DiseaseEntity.empty,
        DiseaseEntity.empty,
      ];
}
