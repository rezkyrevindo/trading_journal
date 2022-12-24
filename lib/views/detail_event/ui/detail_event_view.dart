import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/widgets/custom_button.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../data/models/detail_event_bola_response.dart';
import '../../../utils/colors.dart';
import '../../../utils/validations.dart';
import '../../../widgets/text_field.dart';
import '../../ads_controlling/provider/ads_controlling_provider.dart';
import '../../home/ui/home_view.dart';
import '../provider/detail_event_provider.dart';
import 'inner_widget/info_pertandingan_view.dart';
import 'inner_widget/komentar_view.dart';
import 'inner_widget/pemenang_view.dart';
import 'inner_widget/persyaratan_view.dart';
import 'inner_widget/status_event_view.dart';

class DetailEventView extends StatefulWidget {
  const DetailEventView({super.key});

  @override
  State<DetailEventView> createState() => _DetailEventViewState();
}

class _DetailEventViewState extends State<DetailEventView> {
  bool isExpanded = false;
  Timer? timer;
  Future init() async {
    final provider = Provider.of<DetailEventProvider>(context, listen: false);
    provider.clearData();
    await provider.getDetailEvent(context: context);
    provider.getParticipant(context: context);

    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Detail Event",
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });

    super.initState();
  }

  @override
  void dispose() {
    Logger().e("dispose cancel");
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
        return false;
      },
      child: SafeArea(
        child: Consumer<DetailEventProvider>(
          builder: (context, provider, _) {
            final ActiveEvent? activeEvent =
                provider.detailEventBola?.activeEvent;
            final List<History> winner =
                provider.detailEventBola?.history ?? [];
            return LoadingOverlay(
              isLoading: provider.isLoadingDetailEvent,
              color: Colors.black,
              opacity: 0.65,
              progressIndicator: Lottie.asset(
                'assets/lottie/loading.json',
                width: 100,
                height: 100,
              ),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                  ),
                  backgroundColor: ColorsCustom.mainColor,
                  centerTitle: true,
                  title: const TextCustom(
                    text: "Event Bola",
                    type: TextEnum.HEADLINE5,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.white,
                body: RefreshIndicator(
                  onRefresh: () async {
                    final provider = Provider.of<DetailEventProvider>(
                      context,
                      listen: false,
                    );
                    provider.clearData();
                    await provider.getDetailEvent(context: context);
                    provider.getParticipant(context: context);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        StatusEventView(
                          activeEvent: activeEvent,
                          winner: winner,
                        ),
                        if (activeEvent != null) ...[
                          InfoPertandingan(
                            linkImgHome: activeEvent.linkImgHome ?? "",
                            linkImgAway: activeEvent.linkImgAway ?? "",
                            nameHome: activeEvent.nameHome ?? "",
                            nameAway: activeEvent.nameAway ?? "",
                            jadwalTanding: activeEvent.jadwalTandingString,
                          ),
                          PersyaratanView(
                            persyaratan: activeEvent.persyaratan ?? "",
                          ),
                          KomentarView(
                            activeEvent: activeEvent,
                            listParticipant: provider.participantEventBola,
                            isLoadingParticipant: provider.isLoadingParticipant,
                            onRefreshComment: () {
                              provider.getParticipant(context: context);
                            },
                          ),
                        ] else if (winner.isNotEmpty) ...[
                          InfoPertandingan(
                            linkImgHome: winner[0].linkImgHome ?? "",
                            linkImgAway: winner[0].linkImgAway ?? "",
                            nameHome: winner[0].nameHome ?? "",
                            nameAway: winner[0].nameAway ?? "",
                            jadwalTanding: winner[0].jadwalTandingString,
                          ),
                          PersyaratanView(
                            persyaratan: winner[0].persyaratan ?? "",
                          ),
                          PemenangView(
                            activeEvent: activeEvent,
                            listWinner: winner,
                          ),
                          KomentarView(
                            activeEvent: activeEvent,
                            listParticipant: provider.participantEventBola,
                            isLoadingParticipant: provider.isLoadingParticipant,
                            onRefreshComment: () {
                              provider.getParticipant(context: context);
                            },
                          ),
                        ] else ...[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Lottie.asset(
                                  'assets/lottie/empty.json',
                                  width: width,
                                ),
                                const TextCustom(
                                  text: "Belum Ada Event",
                                  type: TextEnum.HEADLINE6,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (activeEvent != null &&
                            activeEvent.myComment == null)
                          const SizedBox(
                            height: 125,
                          )
                        else
                          const SizedBox()
                      ],
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: activeEvent != null &&
                        activeEvent.myComment == null &&
                        !provider.isLoadingDetailEvent
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: ColorsCustom.greyMudaColor,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 85,
                        width: width - 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFieldCustom(
                                isFieldOnly: true,
                                hintText: "Masukkan tebakan anda disini",
                                controller: provider.comment,
                                validator: (value) => Validations(
                                  noHp: true,
                                  length: 8,
                                  maxLength: 16,
                                  mandatory: true,
                                ).validate(value),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: CustomButton(
                                isActive: true,
                                onTap: () {
                                  provider.saveComment(context: context);
                                },
                                type: ButtonEnum.primary,
                                icon: const Icon(
                                  Icons.send,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            );
          },
        ),
      ),
    );
  }
}
