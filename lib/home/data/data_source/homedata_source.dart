import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/const/app_config.dart';
import 'package:info_dev/home/data/model/abroad_study_model.dart';
import 'package:info_dev/home/data/model/blog_model.dart';
import '../../../core/api_client.dart';
import '../model/featured_services_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ServicesModel>> getServices();
  Future<List<AbroadStudyModel>> getAbroadStudyData();
    Future<List<BlogModel>> getBlog();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<ServicesModel>> getServices() async {
    final result = await _apiClient.request(path: AppConfig.service);
    List data = result;
    return data.map((e) => ServicesModel.fromJson(e)).toList();
  }

  @override
  Future<List<AbroadStudyModel>> getAbroadStudyData() async {
    final result = await _apiClient.request(
        path: AppConfig.abroadStudy, baseUrl: AppConfig.baseUrl2);
    List data = result;
    return data.map((e) => AbroadStudyModel.fromJson(e)).toList();
  }
  
  @override
  Future<List<BlogModel>> getBlog() async{
     final result = await _apiClient.request(
        path: AppConfig.blog, );
    List data = result;
    return data.map((e) => BlogModel.fromJson(e)).toList();

  }
}

final homeDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(ref.watch(apiProvider));
});
