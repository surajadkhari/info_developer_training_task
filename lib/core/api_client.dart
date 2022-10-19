import 'package:dio/dio.dart';
import 'package:info_dev/const/app_config.dart';

class ApiClient {
  Future request({
    required String path,
    Map<String, dynamic> postData = const {},
    String method = "get",
  }) async {
    Dio dio = Dio(
      BaseOptions(baseUrl: AppConfig.baseUrl, headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
      }),
    );
    try {
      Response result = method == "get"
          ? await dio.get(path)
          : await dio.post(path, data: postData);
      return result.data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
