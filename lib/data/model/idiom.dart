import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

part 'idiom.freezed.dart';
part 'idiom.g.dart';

@freezed
class Idiom with _$Idiom {
  static const String boxKey = 'idiom';

  @HiveType(typeId: 0, adapterName: 'IdiomAdapter')
  const factory Idiom({
    @HiveField(0) required String text,
  }) = _Idiom;

  factory Idiom.fromJson(Map<String, dynamic> json) => _$IdiomFromJson(json);
}
