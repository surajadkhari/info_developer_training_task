class BlogModel {
  BlogModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String image;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
