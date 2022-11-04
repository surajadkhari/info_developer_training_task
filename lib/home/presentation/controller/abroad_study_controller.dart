import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/home/data/model/abroad_study_model.dart';
import '../../data/repositories/home_repositories.dart';

class AbroadStudyControllerNotifier
    extends StateNotifier<AsyncValue<List<AbroadStudyModel>>> {
  AbroadStudyControllerNotifier(this._homeRepository)
      : super(const AsyncValue.loading()) {
    fetchData();
  }
  final HomeRepository _homeRepository;

  fetchData() async {
    final result = await _homeRepository.getAbroadStudy();
    return result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final abroadStudyControllerProvider = StateNotifierProvider<
    AbroadStudyControllerNotifier, AsyncValue<List<AbroadStudyModel>>>((ref) {
  return AbroadStudyControllerNotifier(ref.watch(homeRepositoryProvider));
});
