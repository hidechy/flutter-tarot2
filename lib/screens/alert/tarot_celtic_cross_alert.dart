import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/state/tarot_draw/tarot_draw_notifier.dart';

import '../../extensions/extensions.dart';
import '../../model/tarot_one.dart';

// ignore: must_be_immutable
class TarotCelticCrossAlert extends ConsumerWidget {
  TarotCelticCrossAlert({super.key});

  List<TarotOne> tarot10cards = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    makeTarot10Card();

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              // Expanded(child: tarotDisplay()),
              //
              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }

  ///
  void makeTarot10Card() {
    final tarotCardNames = <String>[];

    final cards = <TarotOne>[];

    _ref.watch(tarotDrawProvider(30).select((value) => value.record)).forEach((element) {
      if (!tarotCardNames.contains(element.name)) {
        if (cards.length < 16) {
          cards.add(element);
        }
      }

      tarotCardNames.add(element.name);
    });

    //最初の6枚を捨てる
    for (var i = 6; i < cards.length; i++) {
      tarot10cards.add(cards[i]);
    }
  }
}
