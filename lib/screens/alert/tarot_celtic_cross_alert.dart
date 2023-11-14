import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/state/tarot_draw/tarot_draw_notifier.dart';

import '../../extensions/extensions.dart';
import '../../model/tarot_one.dart';

// ignore: must_be_immutable
class TarotCelticCrossAlert extends ConsumerWidget {
  TarotCelticCrossAlert({super.key});

  List<TarotOne> tarot10cards = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tarot30cards = ref.watch(tarotDrawProvider(30));

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
}
