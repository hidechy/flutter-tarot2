// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tarot_rate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TarotRateState {
  List<TarotRate> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotRateStateCopyWith<TarotRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotRateStateCopyWith<$Res> {
  factory $TarotRateStateCopyWith(
          TarotRateState value, $Res Function(TarotRateState) then) =
      _$TarotRateStateCopyWithImpl<$Res, TarotRateState>;
  @useResult
  $Res call({List<TarotRate> record});
}

/// @nodoc
class _$TarotRateStateCopyWithImpl<$Res, $Val extends TarotRateState>
    implements $TarotRateStateCopyWith<$Res> {
  _$TarotRateStateCopyWithImpl(this._value, this._then);

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
              as List<TarotRate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TarotRateStateCopyWith<$Res>
    implements $TarotRateStateCopyWith<$Res> {
  factory _$$_TarotRateStateCopyWith(
          _$_TarotRateState value, $Res Function(_$_TarotRateState) then) =
      __$$_TarotRateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TarotRate> record});
}

/// @nodoc
class __$$_TarotRateStateCopyWithImpl<$Res>
    extends _$TarotRateStateCopyWithImpl<$Res, _$_TarotRateState>
    implements _$$_TarotRateStateCopyWith<$Res> {
  __$$_TarotRateStateCopyWithImpl(
      _$_TarotRateState _value, $Res Function(_$_TarotRateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$_TarotRateState(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotRate>,
    ));
  }
}

/// @nodoc

class _$_TarotRateState implements _TarotRateState {
  const _$_TarotRateState({required final List<TarotRate> record})
      : _record = record;

  final List<TarotRate> _record;
  @override
  List<TarotRate> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotRateState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TarotRateState &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TarotRateStateCopyWith<_$_TarotRateState> get copyWith =>
      __$$_TarotRateStateCopyWithImpl<_$_TarotRateState>(this, _$identity);
}

abstract class _TarotRateState implements TarotRateState {
  const factory _TarotRateState({required final List<TarotRate> record}) =
      _$_TarotRateState;

  @override
  List<TarotRate> get record;
  @override
  @JsonKey(ignore: true)
  _$$_TarotRateStateCopyWith<_$_TarotRateState> get copyWith =>
      throw _privateConstructorUsedError;
}
