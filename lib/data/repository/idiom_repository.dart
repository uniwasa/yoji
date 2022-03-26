import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local_data_source.dart';
import '../model/idiom.dart';

final idiomRepositoryProvider = Provider((ref) => IdiomRepository(ref.read));

class IdiomRepository {
  const IdiomRepository(this._read);

  final Reader _read;

  Stream<BoxEvent> getIdiomBoxEvent() {
    return _read(localDataSourceProvider).getIdiomBoxEvent();
  }

  List<Idiom> getIdioms() {
    return _read(localDataSourceProvider).getIdioms();
  }

  void addIdiom(Idiom idiom) {
    _read(localDataSourceProvider).addIdiom(idiom);
  }
}
