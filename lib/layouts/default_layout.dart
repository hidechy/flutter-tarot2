// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/tarot_all.dart';
import '../state/tarot_rate_state.dart';

import '../utility/utility.dart';
import '../viewmodel/tarot_all_viewmodel.dart';
import '../viewmodel/tarot_rate_viewmodel.dart';

class DefaultLayout extends ConsumerWidget {
  DefaultLayout(
      {super.key,
      required this.widget,
      required this.title,
      required this.isTitleDisplay});

  final String title;
  final Widget widget;
  final bool isTitleDisplay;

  final Utility _utility = Utility();

  late TarotRateState tarotRateState_big;
  late TarotRateState tarotRateState_cups;
  late TarotRateState tarotRateState_pentacles;
  late TarotRateState tarotRateState_swords;
  late TarotRateState tarotRateState_wands;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    tarotRateState_big = _ref.watch(tarotRateProvider('big'));
    tarotRateState_cups = _ref.watch(tarotRateProvider('cups'));
    tarotRateState_pentacles = _ref.watch(tarotRateProvider('pentacles'));
    tarotRateState_swords = _ref.watch(tarotRateProvider('swords'));
    tarotRateState_wands = _ref.watch(tarotRateProvider('wands'));

    return Scaffold(
      appBar: isTitleDisplay
          ? AppBar(
              title: Text(title),
              backgroundColor: Colors.transparent,
            )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _utility.getBackGround(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget,
            ),
          ),
        ],
      ),
      drawer: dispDrawer(context),
    );
  }

  ///
  Widget dispDrawer(BuildContext context) {
    final allTarotState = _ref.watch(tarotAllProvider);

    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.yellowAccent.withOpacity(0.5),
                width: 5,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              if (allTarotState.record['big'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allTarotState.record['big']!.map((val) {
                        return makeDrawerCard(data: val, category: 'big');
                      }).toList(),
                    ),
                  ],
                ),
              if (allTarotState.record['cups'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Cups'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allTarotState.record['cups']!.map((val) {
                        return makeDrawerCard(data: val, category: 'cups');
                      }).toList(),
                    ),
                  ],
                ),
              if (allTarotState.record['pentacles'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Pentacles'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allTarotState.record['pentacles']!.map((val) {
                        return makeDrawerCard(data: val, category: 'pentacles');
                      }).toList(),
                    ),
                  ],
                ),
              if (allTarotState.record['swords'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Swords'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allTarotState.record['swords']!.map((val) {
                        return makeDrawerCard(data: val, category: 'swords');
                      }).toList(),
                    ),
                  ],
                ),
              if (allTarotState.record['wands'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Wands'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allTarotState.record['wands']!.map((val) {
                        return makeDrawerCard(data: val, category: 'wands');
                      }).toList(),
                    ),
                  ],
                ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget makeDrawerTitle({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Text(title),
    );
  }

  ///
  Widget makeDrawerCard({required TarotAll data, required String category}) {
    var tarotRateState = const TarotRateState(record: []);
    switch (category) {
      case 'big':
        tarotRateState = tarotRateState_big;
        break;
      case 'cups':
        tarotRateState = tarotRateState_cups;
        break;
      case 'pentacles':
        tarotRateState = tarotRateState_pentacles;
        break;
      case 'swords':
        tarotRateState = tarotRateState_swords;
        break;
      case 'wands':
        tarotRateState = tarotRateState_wands;
        break;
    }

    final image = 'http://toyohide.work/BrainLog/tarotcards/${data.image}.jpg';

    final size = MediaQuery.of(_context).size;

    return Card(
      color: Colors.black.withOpacity(0.1),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height / 6,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  child: Image.network(image),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Text(data.msgJ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          data.drawNumJ.length.toString(),
                          style: TextStyle(
                            color: (data.drawNumJ.isEmpty)
                                ? Colors.yellowAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                      Text(data.msgR),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          data.drawNumR.length.toString(),
                          style: TextStyle(
                            color: (data.drawNumR.isEmpty)
                                ? Colors.yellowAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      getTarotRate(id: data.id, state: tarotRateState),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.yellowAccent.withOpacity(0.3),
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget getTarotRate({required int id, required TarotRateState state}) {
    var rate = '';

    for (var i = 0; i < state.record.length; i++) {
      if (state.record[i].id == id) {
        rate = state.record[i].rate;
        break;
      }
    }

    final exRate = rate.split(' / ');

    return Container(
      alignment: Alignment.topRight,
      child: Text(
        rate,
        style: TextStyle(
            color: (exRate[0] == '0') ? Colors.yellowAccent : Colors.white),
      ),
    );
  }
}
