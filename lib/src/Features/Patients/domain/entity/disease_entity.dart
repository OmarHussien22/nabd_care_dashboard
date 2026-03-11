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

  static List<DiseaseEntity> emptyList = [
    DiseaseEntity(id: 1, name: "diabetes"),
    DiseaseEntity(id: 2, name: "hypertension"),
    DiseaseEntity(id: 3, name: "heart_disease"),
    DiseaseEntity(id: 4, name: "asthma"),
    DiseaseEntity(id: 5, name: "kidney_disease"),
    DiseaseEntity(id: 6, name: "thyroid_disease"),
  ];
}
