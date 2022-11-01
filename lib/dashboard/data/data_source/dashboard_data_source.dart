import 'package:info_dev/const/app_config.dart';
import 'package:info_dev/core/api_client.dart';
import 'package:info_dev/dashboard/data/model/service_model.dart';

abstract class DashBoardRemoteDataSource {
  Future<ServicesModel> getServices();
}

class DashBoardRemoteDataScourseImpl implements DashBoardRemoteDataSource {
  final ApiClient _apiClient;
  DashBoardRemoteDataScourseImpl(this._apiClient);

  @override
  Future<ServicesModel> getServices() async {
    final result = await _apiClient.request(path: AppConfig.service);
    return ServicesModel.fromJson(result);
  }
}
