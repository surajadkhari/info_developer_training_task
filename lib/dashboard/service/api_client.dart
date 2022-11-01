import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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


final apiProvider = Provider<ApiClient>((ref) {
  return ApiClient() ;
});
