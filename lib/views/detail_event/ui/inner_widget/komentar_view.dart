import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trading_journal/widgets/custom_button.dart';
import 'package:trading_journal/widgets/komentar_card.dart';

import '../../../../data/models/detail_event_bola_response.dart';
import '../../../../data/models/participant_event_bola_response.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/placeholder_card.dart';
import '../../../../widgets/text.dart';

class KomentarView extends StatefulWidget {
  final ActiveEvent? activeEvent;
  final List<ParticipantEventBola> listParticipant;
  final bool isLoadingParticipant;
  final Function() onRefreshComment;
  const KomentarView({
    super.key,
    this.activeEvent,
    required this.listParticipant,
    required this.isLoadingParticipant,
    required this.onRefreshComment,
  });

  @override
  State<KomentarView> createState() => _KomentarViewState();
}

class _KomentarViewState extends State<KomentarView> {
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
          if (widget.activeEvent?.myComment != null) ...[
            Container(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: const TextCustom(
                text: "Komentar Saya",
                type: TextEnum.HEADLINE6,
              ),
            ),
            KomentarCard(
              participant: ParticipantEventBola(
                comment: widget.activeEvent?.myComment?.comment ?? "",
                noHp: "Anda",
                createdDate: widget.activeEvent?.myComment?.createdDate ?? "",
              ),
            ),
          ],
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: const TextCustom(
              text: "Komentar",
              type: TextEnum.HEADLINE6,
            ),
          ),
          if (widget.listParticipant.isEmpty &&
              !widget.isLoadingParticipant) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Lottie.asset(
                    'assets/lottie/empty.json',
                    width: 200,
                  ),
                  const TextCustom(
                    text: "Belum ada komentar",
                    type: TextEnum.LABEL,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
          for (var value in widget.listParticipant) ...[
            KomentarCard(
              participant: value,
            ),
          ],
          if (widget.isLoadingParticipant) ...[
            const PlaceholderCard(),
            const PlaceholderCard(),
            const PlaceholderCard(),
          ],
          if (!widget.isLoadingParticipant &&
              widget.listParticipant.length % 5 == 0) ...[
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                width: 80,
                child: CustomButton(
                  isActive: true,
                  onTap: widget.onRefreshComment,
                  type: ButtonEnum.primary,
                  icon: const Icon(
                    Icons.sync,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
