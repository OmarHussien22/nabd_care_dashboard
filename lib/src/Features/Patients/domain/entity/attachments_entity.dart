class AttachmentsEntity {
  final int id;
  final String url;
  final String name;

  const AttachmentsEntity({
    required this.id,
    required this.url,
    required this.name,
  });

  static const AttachmentsEntity empty = AttachmentsEntity(
    id: 0,
    url: '',
    name: '',
  );

  static List<AttachmentsEntity> get emptyList => [
        AttachmentsEntity.empty,
        AttachmentsEntity.empty,
        AttachmentsEntity.empty,
        AttachmentsEntity.empty,
      ];
}
