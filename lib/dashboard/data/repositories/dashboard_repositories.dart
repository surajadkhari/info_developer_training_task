import 'package:dartz/dartz.dart';
import 'package:info_dev/core/app_error.dart';
import 'package:info_dev/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:info_dev/dashboard/data/model/service_model.dart';

import '../../../core/api_exception.dart';

abstract class DashBoardRepository {
  Future<Either<AppError, List<ServicesModel>>> getServiceList();
}

class DashBoardRepositoryImpl extends DashBoardRepository {
  final DashBoardRemoteDataSource _dashBoardRemoteDataSource;
  DashBoardRepositoryImpl(this._dashBoardRemoteDataSource);
  @override
  Future<Either<AppError, List<ServicesModel>>> getServiceList() async {
    try {
      final result = await _dashBoardRemoteDataSource.getServices();
      return Right(result);
    } on ApiException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}
