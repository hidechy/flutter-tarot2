// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/model/tarot_all.dart';

import '../layouts/_components/tarot_alert.dart';
import '../layouts/default_layout.dart';
import '../viewmodel/tarot_all_viewmodel.dart';
import '../viewmodel/tarot_today_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<TarotAll> straightAll = [];

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    final tarotStraightAllState = ref.watch(tarotStraightAllProvider);
    straightAll = tarotStraightAllState.record;

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
      isDrawerDisplay: true,
      widget: DefaultTextStyle(
        style: const TextStyle(fontSize: 14),
        child: Column(
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
            GestureDetector(
              onTap: () {
                showTarotDialog(id: int.parse(tarotTodayState.record.id));
              },
              child: const Icon(Icons.info_outline),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(tarotTodayState.record.prof2),
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
                style: const TextStyle(color: Colors.yellowAccent),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(tarotTodayState.record.msg1),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(tarotTodayState.record.msg2),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(tarotTodayState.record.msg3),
            ),
          ],
        ),
      ),
    );
  }

  ///
  void showTarotDialog({required int id}) {
    var data = TarotAll(
      id: 0,
      name: '',
      image: '',
      prof1: '',
      prof2: '',
      wordJ: '',
      wordR: '',
      msgJ: '',
      msgR: '',
      msg2J: '',
      msg2R: '',
      msg3J: '',
      msg3R: '',
      drawNum: '',
      drawNumJ: [],
      drawNumR: [],
    );

    for (var i = 0; i < straightAll.length; i++) {
      if (straightAll[i].id == id) {
        data = straightAll[i];
        break;
      }
    }

    showDialog(
      context: _context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          insetPadding: const EdgeInsets.all(30),
          child: TarotAlert(data: data),
        );
      },
    );
  }
}
