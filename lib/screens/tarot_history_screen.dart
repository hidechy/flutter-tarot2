// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:tarot/utility/utility.dart';

import '../layouts/default_layout.dart';
import '../model/tarot_all.dart';
import '../model/tarot_history.dart';
import '../viewmodel/tarot_all_viewmodel.dart';
import '../viewmodel/tarot_history_screen.dart';

class TarotHistoryScreen extends ConsumerWidget {
  TarotHistoryScreen({super.key});

  final autoScrollController = AutoScrollController();

  final Utility _utility = Utility();

  List<Map<String, dynamic>> buttonList = [];

  List<TarotAll> straightAll = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotHistoryState = ref.watch(tarotHistoryProvider);

    final tarotStraightAllState = ref.watch(tarotStraightAllProvider);
    straightAll = tarotStraightAllState.record;

    makeJumpButton(data: tarotHistoryState.record);

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      isDrawerDisplay: false,
      widget: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            child: SingleChildScrollView(
              child: Wrap(
                children: buttonList.map((val) {
                  return GestureDetector(
                    onTap: () {
                      autoScrollController.scrollToIndex(
                        int.parse(val['pos'].toString()),
                        preferPosition: AutoScrollPosition.begin,
                      );
                    },
                    child: Container(
                      width: size.width / 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green[900]!.withOpacity(0.8),
                      ),
                      child: Text(
                        val['ym'].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.7 - 80,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              controller: autoScrollController,
              itemCount: tarotHistoryState.record.length,
              itemBuilder: (context, index) {
                final date =
                    '${tarotHistoryState.record[index].year}-${tarotHistoryState.record[index].month}-${tarotHistoryState.record[index].day}';

                final qt =
                    (tarotHistoryState.record[index].reverse == '0') ? 0 : 2;

                final image = (tarotHistoryState.record[index].image == '')
                    ? ''
                    : 'http://toyohide'
                        '.work/BrainLog/tarotcards/${tarotHistoryState.record[index].image}.jpg';

                return AutoScrollTag(
                  key: ValueKey(index),
                  index: index,
                  controller: autoScrollController,
                  child: Card(
                    color: Colors.black.withOpacity(0.1),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: size.height / 8,
                      ),
                      child: Row(
                        children: [
                          if (image != '')
                            SizedBox(
                              width: 50,
                              child: RotatedBox(
                                quarterTurns: qt,
                                child: Image.network(image),
                              ),
                            ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Text(date),
                                ),
                                Text(tarotHistoryState.record[index].name),
                                Text(tarotHistoryState.record[index].word),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _utility.showTarotDialog(
                                    id: int.parse(
                                      tarotHistoryState.record[index].id
                                          .toString(),
                                    ),
                                    state: straightAll,
                                    context: context,
                                  );
                                },
                                icon: const Icon(Icons.info_outline),
                              ),
                              Text(
                                tarotHistoryState.record[index].id.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///
  void makeJumpButton({required List<TarotHistory> data}) {
    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      if ('${data[i].year}-${data[i].month}' != keepYm) {
        final map = <String, dynamic>{};
        map['pos'] = i;
        map['ym'] = '${data[i].year}-${data[i].month}';
        buttonList.add(map);
      }

      keepYm = '${data[i].year}-${data[i].month}';
    }
  }
}
