class UserRequesttModel {
  final String username;
  final String userjob;

  UserRequesttModel({required this.username, required this.userjob});
  
 Map<String,dynamic> sendData() {
    return {
      "name": username,
      "job": userjob,
    };
  }
}
