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

  Idiom? getIdiom(int id) {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    return idiomBox.getAt(id);
  }

  List<Idiom> getIdioms() {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    return idiomBox.values.toList();
  }

  void addIdiom(Idiom idiom) {
    final idiomBox = Hive.box<Idiom>(Idiom.boxKey);
    idiomBox.add(idiom);
  }
}
