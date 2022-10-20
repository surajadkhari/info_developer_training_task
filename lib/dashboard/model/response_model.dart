class UserResponseModel {
  final String userId;
  final DateTime createdAt;

  UserResponseModel({required this.userId, required this.createdAt});

  factory UserResponseModel.fromJson({required Map<String, dynamic> json}) {
    return UserResponseModel(
      userId: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
