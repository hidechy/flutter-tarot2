import 'package:flutter/material.dart';

import '../../model/tarot_all.dart';

class TarotAlert extends StatelessWidget {
  const TarotAlert({super.key, required this.data});

  final TarotAll data;

  @override
  Widget build(BuildContext context) {
    final image = (data.image == '')
        ? ''
        : 'http://toyohide.work/BrainLog/tarotcards/${data.image}.jpg';

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.withOpacity(0.3),
                      ),
                      child: Text(DateTime.now().toString().split(' ')[0]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.withOpacity(0.3),
                      ),
                      child: Text(data.image),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 30),
                ),
                Image.network(image),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(data.prof1),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(data.prof2),
                ),
                const Divider(color: Colors.indigo),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('正位置'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    data.wordJ,
                    style: const TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(data.msgJ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg2J),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg3J),
                ),
                const Divider(color: Colors.indigo),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('逆位置'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    data.wordR,
                    style: const TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(data.msgR),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg2R),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg3R),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
