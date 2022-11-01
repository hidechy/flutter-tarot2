// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tarot_all_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TarotAllState {
  Map<String, List<TarotAll>> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotAllStateCopyWith<TarotAllState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotAllStateCopyWith<$Res> {
  factory $TarotAllStateCopyWith(
          TarotAllState value, $Res Function(TarotAllState) then) =
      _$TarotAllStateCopyWithImpl<$Res, TarotAllState>;
  @useResult
  $Res call({Map<String, List<TarotAll>> record});
}

/// @nodoc
class _$TarotAllStateCopyWithImpl<$Res, $Val extends TarotAllState>
    implements $TarotAllStateCopyWith<$Res> {
  _$TarotAllStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TarotAll>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TarotAllStateCopyWith<$Res>
    implements $TarotAllStateCopyWith<$Res> {
  factory _$$_TarotAllStateCopyWith(
          _$_TarotAllState value, $Res Function(_$_TarotAllState) then) =
      __$$_TarotAllStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<TarotAll>> record});
}

/// @nodoc
class __$$_TarotAllStateCopyWithImpl<$Res>
    extends _$TarotAllStateCopyWithImpl<$Res, _$_TarotAllState>
    implements _$$_TarotAllStateCopyWith<$Res> {
  __$$_TarotAllStateCopyWithImpl(
      _$_TarotAllState _value, $Res Function(_$_TarotAllState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$_TarotAllState(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TarotAll>>,
    ));
  }
}

/// @nodoc

class _$_TarotAllState implements _TarotAllState {
  const _$_TarotAllState({required final Map<String, List<TarotAll>> record})
      : _record = record;

  final Map<String, List<TarotAll>> _record;
  @override
  Map<String, List<TarotAll>> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_record);
  }

  @override
  String toString() {
    return 'TarotAllState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TarotAllState &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TarotAllStateCopyWith<_$_TarotAllState> get copyWith =>
      __$$_TarotAllStateCopyWithImpl<_$_TarotAllState>(this, _$identity);
}

abstract class _TarotAllState implements TarotAllState {
  const factory _TarotAllState(
      {required final Map<String, List<TarotAll>> record}) = _$_TarotAllState;

  @override
  Map<String, List<TarotAll>> get record;
  @override
  @JsonKey(ignore: true)
  _$$_TarotAllStateCopyWith<_$_TarotAllState> get copyWith =>
      throw _privateConstructorUsedError;
}
