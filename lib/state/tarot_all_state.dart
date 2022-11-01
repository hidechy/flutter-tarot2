import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/tarot_all.dart';

part 'tarot_all_state.freezed.dart';

@freezed
class TarotAllState with _$TarotAllState {
  const factory TarotAllState({
    required Map<String, List<TarotAll>> record,
  }) = _TarotAllState;
}
