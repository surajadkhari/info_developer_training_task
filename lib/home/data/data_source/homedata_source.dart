import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/const/app_config.dart';
import '../../../core/api_client.dart';
import '../model/featured_services_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ServicesModel>> getServices();
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
}

final homeDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(ref.watch(apiProvider));
});
