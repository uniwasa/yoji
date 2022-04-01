import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

part 'idiom.freezed.dart';
part 'idiom.g.dart';

@freezed
@HiveType(typeId: 0)
class Idiom extends HiveObject with _$Idiom {
  static const String boxKey = 'idiom';

  Idiom._();
  factory Idiom({
    @HiveField(0) required String text,
    @HiveField(1) required String? kana,
    @HiveField(2) required String? note,
  }) = _Idiom;

  factory Idiom.fromJson(Map<String, dynamic> json) => _$IdiomFromJson(json);
}
