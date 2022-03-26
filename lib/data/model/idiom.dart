import 'package:hive/hive.dart';

part 'idiom.g.dart';

@HiveType(typeId: 0)
class Idiom {
  static const String boxKey = 'idiom';

  Idiom({required this.text});

  @HiveField(0)
  String text;
}
