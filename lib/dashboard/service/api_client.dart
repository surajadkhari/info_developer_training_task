import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:info_dev/dashboard/model/response_model.dart';

class ApiClient {
  Future request(
      {required String methodType,
      required String endPoint,
      Map<String, dynamic>? data = const {}}) async {
    final response = methodType == "get"
        ? await http.get(Uri.parse(endPoint))
        : await http.post(Uri.parse(endPoint),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode(data));
    return response;
  }
}

class ApiService {
  Future<UserResponseModel> createUser(
      {required Map<String, dynamic> userModel}) async {
    Response result = await ApiClient().request(
      methodType: "post",
      endPoint: "https://reqres.in/api/users",
      data: userModel,
    );
    if (result.statusCode == 201) {
      return UserResponseModel.fromJson(json: jsonDecode(result.body));
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
