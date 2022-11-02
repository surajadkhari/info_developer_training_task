class ServicesModel {
  final int id;
  final String title;
  final String slug;
  final String image;
  final String content;

  ServicesModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.content,
  });
  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        content: json["content"],
      );
}
