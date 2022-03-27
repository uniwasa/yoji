// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idiom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdiomAdapter extends TypeAdapter<_$_Idiom> {
  @override
  final int typeId = 0;

  @override
  _$_Idiom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Idiom(
      text: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Idiom obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.text);
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
    );

Map<String, dynamic> _$$_IdiomToJson(_$_Idiom instance) => <String, dynamic>{
      'text': instance.text,
    };
