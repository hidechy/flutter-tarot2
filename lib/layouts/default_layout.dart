// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utility/utility.dart';
import '../viewmodel/tarot_all_viewmodel.dart';
import '_components/drawer_card.dart';

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

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

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
    final tarotAllState = _ref.watch(tarotAllProvider);

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
              if (tarotAllState.record['big'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tarotAllState.record['big']!.map((val) {
                        return DrawerCard(data: val, category: 'big');
                      }).toList(),
                    ),
                  ],
                ),
              if (tarotAllState.record['cups'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Cups'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tarotAllState.record['cups']!.map((val) {
                        return DrawerCard(data: val, category: 'cups');
                      }).toList(),
                    ),
                  ],
                ),
              if (tarotAllState.record['pentacles'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Pentacles'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tarotAllState.record['pentacles']!.map((val) {
                        return DrawerCard(data: val, category: 'pentacles');
                      }).toList(),
                    ),
                  ],
                ),
              if (tarotAllState.record['swords'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Swords'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tarotAllState.record['swords']!.map((val) {
                        return DrawerCard(data: val, category: 'swords');
                      }).toList(),
                    ),
                  ],
                ),
              if (tarotAllState.record['wands'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    makeDrawerTitle(title: 'Wands'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tarotAllState.record['wands']!.map((val) {
                        return DrawerCard(data: val, category: 'wands');
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
}
