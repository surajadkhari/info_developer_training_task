class UserResponseModel {
  final String job;
  final DateTime createdAt;
  final String name;
  final String id;

  UserResponseModel({required this.job, required this.createdAt,required this.id,required this.name});

  factory UserResponseModel.fromJson({required Map<String, dynamic> json}) {
    return UserResponseModel(
      job: json["job"],
      name: json["name"],
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
