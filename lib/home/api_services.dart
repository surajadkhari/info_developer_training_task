import 'dart:convert';

import 'package:http/http.dart';
import 'package:info_dev/core/api_client.dart';
import 'package:info_dev/home/model/user_model.dart';
import 'package:info_dev/main.dart';

class ApiSerivce {
  Future<UserModel> getuserData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
