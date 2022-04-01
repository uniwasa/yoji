import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/idiom.dart';
import '../../../data/repository/idiom_repository.dart';

final idiomEditControllerProvider = StateNotifierProvider.autoDispose
    .family<IdiomEditController, AsyncValue<Idiom?>, int?>(
        (ref, idiomKey) => IdiomEditController(ref.read, idiomKey));

class IdiomEditController extends StateNotifier<AsyncValue<Idiom?>> {
  IdiomEditController(this._read, this._idiomKey)
      : super(const AsyncLoading()) {
    init();
  }

  final Reader _read;
  final int? _idiomKey;

  @override
  void dispose() {
    super.dispose();
  }

  void init() {
    if (_idiomKey != null) {
      state = AsyncData(_read(idiomRepositoryProvider).getIdiom(_idiomKey!));
    } else {
      state = const AsyncData(null);
    }
  }

  void saveIdiom(
    Idiom? idiom, {
    required String text,
    required String kana,
    required String note,
  }) {
    final newIdiom = Idiom(text: text,kana: kana,note: note);
    if (idiom != null) {
      _read(idiomRepositoryProvider)
          .updateIdiom(idiom.key,newIdiom);
    } else {
      _read(idiomRepositoryProvider)
          .addIdiom(newIdiom);
    }
  }

  void deleteIdiom(Idiom idiom) {
      _read(idiomRepositoryProvider).deleteIdiom(idiom);
  }
}
