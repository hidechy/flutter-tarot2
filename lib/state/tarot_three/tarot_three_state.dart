import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_one.dart';

part 'tarot_three_state.freezed.dart';

@freezed
class TarotThreeState with _$TarotThreeState {
  const factory TarotThreeState({
    required List<TarotOne> record,
  }) = _TarotThreeState;
}
