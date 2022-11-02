import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/core/app_error.dart';
import '../data_source/homedata_source.dart';
import '../model/featured_services_model.dart';

abstract class HomeRepository {
  Future<Either<AppError, List<ServicesModel>>> getServiceList();
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoryImpl(this._homeRemoteDataSource);
  @override
  Future<Either<AppError, List<ServicesModel>>> getServiceList() async {
    try {
      final result = await _homeRemoteDataSource.getServices();
      return Right(result);
    } on DioError catch (e) {
      return Left(AppError(e.message));
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(ref.watch(homeDataSourceProvider));
});
