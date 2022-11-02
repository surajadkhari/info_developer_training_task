import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/home/data/model/featured_services_model.dart';
import 'package:info_dev/home/data/repositories/home_repositories.dart';

class HomeFeaturedServicesControllerNotifier
    extends StateNotifier<AsyncValue<List<ServicesModel>>> {
  HomeFeaturedServicesControllerNotifier(this._homeRepository)
      : super(const AsyncValue.loading()) {
    fetchData();
  }
  final HomeRepository _homeRepository;

  fetchData() async {
    final result = await _homeRepository.getServiceList();
    return result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final homefeaturedServiceControllerProvider = StateNotifierProvider<
    HomeFeaturedServicesControllerNotifier,
    AsyncValue<List<ServicesModel>>>((ref) {
  return HomeFeaturedServicesControllerNotifier(
      ref.watch(homeRepositoryProvider));
});