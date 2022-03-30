import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/idiom.dart';
import '../../data/repository/idiom_repository.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<List<Idiom>>>(
        (ref) => HomeController(ref.read));

class HomeController extends StateNotifier<AsyncValue<List<Idiom>>> {
  HomeController(this._read) : super(const AsyncLoading()) {
    init();
    _subscription =
        _read(idiomRepositoryProvider).getIdiomBoxEvent().listen((event) {
      refresh();
    });
  }

  final Reader _read;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void init() {
    state = AsyncData(_read(idiomRepositoryProvider).getIdioms());
  }

  void refresh() {
    state = AsyncData(_read(idiomRepositoryProvider).getIdioms());
  }
}
