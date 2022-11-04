import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/home/data/model/blog_model.dart';
import '../../data/repositories/home_repositories.dart';

class BlogControllerNotifier
    extends StateNotifier<AsyncValue<List<BlogModel>>> {
  BlogControllerNotifier(this._homeRepository)
      : super(const AsyncValue.loading()) {
    fetchData();
  }
  final HomeRepository _homeRepository;

  fetchData() async {
    final result = await _homeRepository.getBlog();
    return result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final blogControllerProvider =
    StateNotifierProvider<BlogControllerNotifier, AsyncValue<List<BlogModel>>>(
        (ref) {
  return BlogControllerNotifier(ref.watch(homeRepositoryProvider));
});
