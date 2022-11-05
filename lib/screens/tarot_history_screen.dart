// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../layouts/default_layout.dart';
import '../model/tarot_history.dart';
import '../viewmodel/tarot_history_screen.dart';

class TarotHistoryScreen extends ConsumerWidget {
  TarotHistoryScreen({super.key});

  final autoScrollController = AutoScrollController();

  List<Map<String, dynamic>> buttonList = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotHistoryState = ref.watch(tarotHistoryProvider);

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
          SizedBox(
            width: double.infinity,
            height: size.height * 0.2,
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
                        color: Colors.yellowAccent.withOpacity(0.2),
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
              padding: EdgeInsets.zero,
              controller: autoScrollController,
              itemCount: tarotHistoryState.record.length,
              itemBuilder: (context, index) {
                final date =
                    '${tarotHistoryState.record[index].year}-${tarotHistoryState.record[index].month}-${tarotHistoryState.record[index].day}';

                return AutoScrollTag(
                  key: ValueKey(index),
                  index: index,
                  controller: autoScrollController,
                  child: Card(
                    color: Colors.black.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date),
                        Text(tarotHistoryState.record[index].name),
                      ],
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
