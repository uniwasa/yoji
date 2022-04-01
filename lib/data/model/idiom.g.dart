// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idiom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdiomAdapter extends TypeAdapter<Idiom> {
  @override
  final int typeId = 0;

  @override
  Idiom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Idiom(
      text: fields[0] as String,
      kana: fields[1] as String?,
      note: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Idiom obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.kana)
      ..writeByte(2)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdiomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Idiom _$$_IdiomFromJson(Map<String, dynamic> json) => _$_Idiom(
      text: json['text'] as String,
      kana: json['kana'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_IdiomToJson(_$_Idiom instance) => <String, dynamic>{
      'text': instance.text,
      'kana': instance.kana,
      'note': instance.note,
    };
