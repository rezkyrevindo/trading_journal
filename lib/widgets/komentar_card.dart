import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/widgets/text.dart';

import '../data/models/participant_event_bola_response.dart';
import '../utils/colors.dart';

class KomentarCard extends StatelessWidget {
  final ParticipantEventBola participant;
  const KomentarCard({super.key, required this.participant});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/profile_${Random().nextInt(6) + 1}.jpg",
                  height: 48,
                  width: 48,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: width,
                  decoration: BoxDecoration(
                    color: ColorsCustom.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(text: participant.noHp, type: TextEnum.LABEL),
                      TextCustom(
                        text: participant.comment,
                        type: TextEnum.CAPTION,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          if (participant.createdDate != null) ...[
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 68,
                ),
                TextCustom(
                  text: participant.createdDateString,
                  type: TextEnum.CAPTION,
                ),
              ],
            )
          ]
        ],
      ),
    );
  }
}
