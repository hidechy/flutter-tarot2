import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/tarot_today_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotTodayState = ref.watch(
      tarotTodayProvider(DateTime.now().toString().split(' ')[0]),
    );

    final qt = (tarotTodayState.record.reverse == 'just') ? 0 : 2;

    final image = (tarotTodayState.record.image == '')
        ? ''
        : 'http://toyohide.work/BrainLog/tarotcards/${tarotTodayState.record.image}.jpg';

    return DefaultLayout(
      title: 'Today\'s Tarot',
      isTitleDisplay: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.3),
                ),
                child: Text(DateTime.now().toString().split(' ')[0]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.3),
                ),
                child: Text(tarotTodayState.record.image),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            tarotTodayState.record.name,
            style: const TextStyle(fontSize: 30),
          ),
          if (image != '')
            RotatedBox(
              quarterTurns: qt,
              child: Image.network(image),
            ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              tarotTodayState.record.prof2,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(color: Colors.indigo),
          Container(
            alignment: Alignment.topLeft,
            decoration:
                BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              (tarotTodayState.record.reverse == 'just') ? '正位置' : '逆位置',
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              tarotTodayState.record.word,
              style: const TextStyle(fontSize: 14, color: Colors.yellowAccent),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Text(
              tarotTodayState.record.msg1,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              tarotTodayState.record.msg2,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              tarotTodayState.record.msg3,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
