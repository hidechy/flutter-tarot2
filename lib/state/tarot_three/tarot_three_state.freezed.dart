// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_three_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TarotThreeState {
  List<TarotOne> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotThreeStateCopyWith<TarotThreeState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotThreeStateCopyWith<$Res> {
  factory $TarotThreeStateCopyWith(TarotThreeState value, $Res Function(TarotThreeState) then) =
      _$TarotThreeStateCopyWithImpl<$Res, TarotThreeState>;

  @useResult
  $Res call({List<TarotOne> record});
}

/// @nodoc
class _$TarotThreeStateCopyWithImpl<$Res, $Val extends TarotThreeState> implements $TarotThreeStateCopyWith<$Res> {
  _$TarotThreeStateCopyWithImpl(this._value, this._then);

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
              as List<TarotOne>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotThreeStateImplCopyWith<$Res> implements $TarotThreeStateCopyWith<$Res> {
  factory _$$TarotThreeStateImplCopyWith(_$TarotThreeStateImpl value, $Res Function(_$TarotThreeStateImpl) then) =
      __$$TarotThreeStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<TarotOne> record});
}

/// @nodoc
class __$$TarotThreeStateImplCopyWithImpl<$Res> extends _$TarotThreeStateCopyWithImpl<$Res, _$TarotThreeStateImpl>
    implements _$$TarotThreeStateImplCopyWith<$Res> {
  __$$TarotThreeStateImplCopyWithImpl(_$TarotThreeStateImpl _value, $Res Function(_$TarotThreeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotThreeStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotOne>,
    ));
  }
}

/// @nodoc

class _$TarotThreeStateImpl implements _TarotThreeState {
  const _$TarotThreeStateImpl({required final List<TarotOne> record}) : _record = record;

  final List<TarotOne> _record;

  @override
  List<TarotOne> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotThreeState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotThreeStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotThreeStateImplCopyWith<_$TarotThreeStateImpl> get copyWith =>
      __$$TarotThreeStateImplCopyWithImpl<_$TarotThreeStateImpl>(this, _$identity);
}

abstract class _TarotThreeState implements TarotThreeState {
  const factory _TarotThreeState({required final List<TarotOne> record}) = _$TarotThreeStateImpl;

  @override
  List<TarotOne> get record;

  @override
  @JsonKey(ignore: true)
  _$$TarotThreeStateImplCopyWith<_$TarotThreeStateImpl> get copyWith => throw _privateConstructorUsedError;
}
