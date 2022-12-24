import 'package:flutter/material.dart';
import 'package:trading_journal/widgets/komentar_card.dart';

import '../../../../data/models/detail_event_bola_response.dart';
import '../../../../data/models/participant_event_bola_response.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/text.dart';

class PemenangView extends StatefulWidget {
  final ActiveEvent? activeEvent;
  final List<History> listWinner;
  const PemenangView({
    super.key,
    this.activeEvent,
    required this.listWinner,
  });

  @override
  State<PemenangView> createState() => _PemenangViewState();
}

class _PemenangViewState extends State<PemenangView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: ColorsCustom.greyMudaColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: const TextCustom(
              text: "Pemenang",
              type: TextEnum.HEADLINE6,
            ),
          ),
          for (var value in widget.listWinner[0].winner ?? <Winner>[]) ...[
            KomentarCard(
              participant: ParticipantEventBola(
                comment: "Pemenang akan dihubungi oleh admin",
                noHp: value.noHp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
