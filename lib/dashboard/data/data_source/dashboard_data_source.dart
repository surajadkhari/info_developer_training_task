import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/const/app_config.dart';
import 'package:info_dev/dashboard/data/model/service_model.dart';

import '../../../core/api_client.dart';

abstract class DashBoardRemoteDataSource {
  Future<List<ServicesModel>> getServices();
}

class DashBoardRemoteDataScourseImpl implements DashBoardRemoteDataSource {
  final ApiClient _apiClient;
  DashBoardRemoteDataScourseImpl(this._apiClient);

  @override
  Future<List<ServicesModel>> getServices() async {
    final result = await _apiClient.request(path: AppConfig.service);
    return result.map((e) => ServicesModel.fromJson(result));
  }
}

final dashboardDataSourceProvider = Provider<DashBoardRemoteDataSource>((ref) {
  return DashBoardRemoteDataScourseImpl(ref.watch(apiProvider));
});
