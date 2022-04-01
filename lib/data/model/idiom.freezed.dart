// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'idiom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Idiom _$IdiomFromJson(Map<String, dynamic> json) {
  return _Idiom.fromJson(json);
}

/// @nodoc
class _$IdiomTearOff {
  const _$IdiomTearOff();

  _Idiom call(
      {@HiveField(0) required String text,
      @HiveField(1) required String? kana,
      @HiveField(2) required String? note}) {
    return _Idiom(
      text: text,
      kana: kana,
      note: note,
    );
  }

  Idiom fromJson(Map<String, Object?> json) {
    return Idiom.fromJson(json);
  }
}

/// @nodoc
const $Idiom = _$IdiomTearOff();

/// @nodoc
mixin _$Idiom {
  @HiveField(0)
  String get text => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get kana => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdiomCopyWith<Idiom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdiomCopyWith<$Res> {
  factory $IdiomCopyWith(Idiom value, $Res Function(Idiom) then) =
      _$IdiomCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String text,
      @HiveField(1) String? kana,
      @HiveField(2) String? note});
}

/// @nodoc
class _$IdiomCopyWithImpl<$Res> implements $IdiomCopyWith<$Res> {
  _$IdiomCopyWithImpl(this._value, this._then);

  final Idiom _value;
  // ignore: unused_field
  final $Res Function(Idiom) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? kana = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      kana: kana == freezed
          ? _value.kana
          : kana // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IdiomCopyWith<$Res> implements $IdiomCopyWith<$Res> {
  factory _$IdiomCopyWith(_Idiom value, $Res Function(_Idiom) then) =
      __$IdiomCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String text,
      @HiveField(1) String? kana,
      @HiveField(2) String? note});
}

/// @nodoc
class __$IdiomCopyWithImpl<$Res> extends _$IdiomCopyWithImpl<$Res>
    implements _$IdiomCopyWith<$Res> {
  __$IdiomCopyWithImpl(_Idiom _value, $Res Function(_Idiom) _then)
      : super(_value, (v) => _then(v as _Idiom));

  @override
  _Idiom get _value => super._value as _Idiom;

  @override
  $Res call({
    Object? text = freezed,
    Object? kana = freezed,
    Object? note = freezed,
  }) {
    return _then(_Idiom(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      kana: kana == freezed
          ? _value.kana
          : kana // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Idiom extends _Idiom with DiagnosticableTreeMixin {
  _$_Idiom(
      {@HiveField(0) required this.text,
      @HiveField(1) required this.kana,
      @HiveField(2) required this.note})
      : super._();

  factory _$_Idiom.fromJson(Map<String, dynamic> json) =>
      _$$_IdiomFromJson(json);

  @override
  @HiveField(0)
  final String text;
  @override
  @HiveField(1)
  final String? kana;
  @override
  @HiveField(2)
  final String? note;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Idiom(text: $text, kana: $kana, note: $note)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Idiom'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('kana', kana))
      ..add(DiagnosticsProperty('note', note));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Idiom &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.kana, kana) &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(kana),
      const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  _$IdiomCopyWith<_Idiom> get copyWith =>
      __$IdiomCopyWithImpl<_Idiom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdiomToJson(this);
  }
}

abstract class _Idiom extends Idiom {
  factory _Idiom(
      {@HiveField(0) required String text,
      @HiveField(1) required String? kana,
      @HiveField(2) required String? note}) = _$_Idiom;
  _Idiom._() : super._();

  factory _Idiom.fromJson(Map<String, dynamic> json) = _$_Idiom.fromJson;

  @override
  @HiveField(0)
  String get text;
  @override
  @HiveField(1)
  String? get kana;
  @override
  @HiveField(2)
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$IdiomCopyWith<_Idiom> get copyWith => throw _privateConstructorUsedError;
}
