import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/tarot_history_screen.dart';

class TarotHistoryScreen extends ConsumerWidget {
  TarotHistoryScreen({super.key});

  final autoScrollController = AutoScrollController();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotHistoryState = ref.watch(tarotHistoryProvider);

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
            child: Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    autoScrollController.scrollToIndex(100);
                  },
                  child: const Text('jump'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.7 - 80,
            child: ListView.builder(
              controller: autoScrollController,
              itemCount: tarotHistoryState.record.length,
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  index: index,
                  controller: autoScrollController,
                  child: Text(tarotHistoryState.record[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
