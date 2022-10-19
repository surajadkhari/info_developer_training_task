import 'package:dio/dio.dart';
import 'package:info_dev/const/app_config.dart';
import 'package:info_dev/core/api_client.dart';
import 'package:info_dev/dashboard/model/movie_model.dart';

import '../../core/api_exception.dart';

class ApiRepo {
  Future<List<MovieModel>> gePopularMovielist() async {
    try {
      final result = await ApiClient().request(path: AppConfig.popular);
      final List data = result["result"];
      return data.map((e) => MovieModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
