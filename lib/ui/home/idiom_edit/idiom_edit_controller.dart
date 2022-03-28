import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/idiom.dart';
import '../../../data/repository/idiom_repository.dart';

final idiomEditControllerProvider = StateNotifierProvider.autoDispose
    .family<IdiomEditController, AsyncValue<Idiom?>, int?>(
        (ref, id) => IdiomEditController(ref.read, id));

class IdiomEditController extends StateNotifier<AsyncValue<Idiom?>> {
  IdiomEditController(this._read, this._id) : super(const AsyncLoading()) {
    init();
  }

  final Reader _read;
  final int? _id;

  @override
  void dispose() {
    print('bye');
    super.dispose();
  }

  void init() {
    if (_id != null) {
      state = AsyncData(_read(idiomRepositoryProvider).getIdiom(_id!));
    } else {
      state = const AsyncData(null);
    }
  }

  void addIdiom(String text) {
    final idiom = Idiom(text: text);
    _read(idiomRepositoryProvider).addIdiom(idiom);
  }
}
