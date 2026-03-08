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
    url: 'https://example.com/file1.pdf',
    name: 'file1.pdf',
  );

  static List<AttachmentsEntity> get emptyList => [
        AttachmentsEntity(
          id: 1,
          url: 'https://example.com/file1.pdf',
          name: 'file1.pdf',
        ),
        AttachmentsEntity(
          id: 2,
          url: 'https://example.com/image2.jpg',
          name: 'image2.jpg',
        ),
        AttachmentsEntity(
          id: 3,
          url: 'https://example.com/document3.docx',
          name: 'document3.docx',
        ),
        AttachmentsEntity(
          id: 4,
          url: 'https://example.com/report4.pdf',
          name: 'report4.pdf',
        ),
      ];
}
