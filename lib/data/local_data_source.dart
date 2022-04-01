import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/idiom.dart';

final localDataSourceProvider = Provider((ref) => const LocalDataSource());

class LocalDataSource {
  const LocalDataSource();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Idiom>(IdiomAdapter());
    await Hive.openBox<Idiom>(Idiom.boxKey);
  }

  Stream<BoxEvent> getIdiomBoxEvent() {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    return idiomBox.watch();
  }

  Idiom? getIdiom(int idiomKey) {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    return idiomBox.get(idiomKey);
  }

  List<Idiom> getIdioms() {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    return idiomBox.values.toList();
  }

  void addIdiom(Idiom idiom) {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    idiomBox.add(idiom);
  }

  void updateIdiom(int idiomKey, Idiom idiom) {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    idiomBox.put(idiomKey, idiom);
  }

  void deleteIdiom(Idiom idiom) {
    idiom.delete();
  }
}
