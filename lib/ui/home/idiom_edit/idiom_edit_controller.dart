import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/idiom.dart';
import '../../../data/repository/idiom_repository.dart';

final idiomEditControllerProvider = StateNotifierProvider.autoDispose
    .family<IdiomEditController, AsyncValue<Idiom?>, int?>(
        (ref, index) => IdiomEditController(ref.read, index));

class IdiomEditController extends StateNotifier<AsyncValue<Idiom?>> {
  IdiomEditController(this._read, this._index) : super(const AsyncLoading()) {
    init();
  }

  final Reader _read;
  final int? _index;

  @override
  void dispose() {
    super.dispose();
  }

  void init() {
    if (_index != null) {
      state = AsyncData(_read(idiomRepositoryProvider).getIdiom(_index!));
    } else {
      state = const AsyncData(null);
    }
  }

  void saveIdiom(int? index, Idiom idiom) {
    if (index != null) {
      _read(idiomRepositoryProvider).updateIdiom(index, idiom);
    } else {
      _read(idiomRepositoryProvider).addIdiom(idiom);
    }
  }

  void deleteIdiom(int? index) {
    if (index != null) {
      _read(idiomRepositoryProvider).deleteIdiom(index);
    }
  }
}
