import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../../data/models/detail_event_bola_response.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/text.dart';

class StatusEventView extends StatelessWidget {
  final ActiveEvent? activeEvent;
  final List<History> winner;

  const StatusEventView({
    super.key,
    required this.activeEvent,
    required this.winner,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_raw_strings
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true);
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      color: activeEvent == null && winner.isEmpty
          ? ColorsCustom.thirdColor
          : activeEvent == null
              ? Colors.green
              : ColorsCustom.mainColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextCustom(
              text: activeEvent == null && winner.isEmpty
                  ? "Belum Terdapat Event Berlangsung"
                  : activeEvent == null
                      ? "Event Sudah Selesai"
                      : "Event Sedang Berlangsung",
              type: TextEnum.HEADLINE6,
              color: Colors.white,
            ),
          ),
          if ((activeEvent?.runningText ?? "") != "") ...[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: width,
              height: 25,
              child: Marquee(
                text: (activeEvent?.runningText ?? "").replaceAll(exp, ''),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                blankSpace: 50,
              ),
            ),
          ] else if (winner.isNotEmpty &&
              (winner[0].runningText ?? "") != "") ...[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: width,
              height: 25,
              child: Marquee(
                text: (winner[0].runningText ?? "").replaceAll(exp, ''),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                blankSpace: 50,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
