class AbroadStudyModel {
  AbroadStudyModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.content,
    required this.country,
    required this.whyCountry,
    required this.workingStudying,
    required this.opportunity,
    required this.facts,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String image;
  final String content;
  final String country;
  final String whyCountry;
  final String workingStudying;
  final String opportunity;
  final String facts;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory AbroadStudyModel.fromJson(Map<String, dynamic> json) =>
      AbroadStudyModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        content: json["content"],
        country: json["country"],
        whyCountry: json["why_country"],
        workingStudying: json["working_studying"],
        opportunity: json["opportunity"],
        facts: json["facts"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );


}
