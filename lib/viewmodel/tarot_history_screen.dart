// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../model/tarot_history.dart';
import '../state/tarot_history_state.dart';

final tarotHistoryProvider =
    StateNotifierProvider.autoDispose<TarotHistoryNotifier, TarotHistoryState>(
        (ref) {
  final client = ref.read(httpClientProvider);

  return TarotHistoryNotifier(
    const TarotHistoryState(record: []),
    client,
  )..getTarotHistory();
});

class TarotHistoryNotifier extends StateNotifier<TarotHistoryState> {
  TarotHistoryNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getTarotHistory() async {
    await client.post(path: 'tarothistory').then((value) {
      final list = <TarotHistory>[];
      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        final oneData = value['data'][i];

        list.add(
          TarotHistory(
            year: oneData['year'].toString(),
            month: oneData['month'].toString(),
            day: oneData['day'].toString(),
            id: int.parse(oneData['id'].toString()),
            name: oneData['name'].toString(),
            image: oneData['image'].toString(),
            reverse: oneData['reverse'].toString(),
            word: oneData['word'].toString(),
          ),
        );
      }

      state = state.copyWith(record: list);
    });
  }
}
