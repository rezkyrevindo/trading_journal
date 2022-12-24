import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/prediksi_bola_page_enum.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/home/ui/home_view.dart';
import 'package:trading_journal/views/prediksi_bola/provider/prediksi_bola_provider.dart';
import 'package:trading_journal/widgets/placeholder_card.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../utils/colors.dart';
import '../../../widgets/card_prediksi_bola.dart';
import '../../../widgets/menu_prediksi_bola_button.dart';
import '../../ads_controlling/provider/ads_controlling_provider.dart';

class PrediksiBolaView extends StatefulWidget {
  const PrediksiBolaView({super.key});

  @override
  State<PrediksiBolaView> createState() => _PrediksiBolaViewState();
}

class _PrediksiBolaViewState extends State<PrediksiBolaView> {
  Timer? timer;
  Future init() async {
    final provider = Provider.of<PrediksiBolaProvider>(context, listen: false);
    provider.clearData();
    provider.getListBolaBesar(context: context);
    provider.getListBolaSuccess(context: context);
    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Prediksi Bola",
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsCustom.mainColor,
            centerTitle: true,
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
            title: const TextCustom(
              text: "Prediksi Bola",
              type: TextEnum.HEADLINE5,
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Consumer<PrediksiBolaProvider>(
            builder: (context, provider, _) {
              return RefreshIndicator(
                onRefresh: () async {
                  final provider =
                      Provider.of<PrediksiBolaProvider>(context, listen: false);
                  provider.clearData();
                  provider.getListBolaBesar(context: context);
                  provider.getListBolaSuccess(context: context);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: MenuPrediksiBolaButton(
                                isActive: provider.statePage ==
                                    PrediksiBolaPageEnum.hariini,
                                title: "Prediksi Hari Ini",
                                onTap: () {
                                  provider.statePage =
                                      PrediksiBolaPageEnum.hariini;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MenuPrediksiBolaButton(
                                isActive: provider.statePage ==
                                    PrediksiBolaPageEnum.success,
                                title: "Prediksi Sukses",
                                onTap: () {
                                  provider.statePage =
                                      PrediksiBolaPageEnum.success;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 25,
                        child: Marquee(
                          text: "${provider.runningText} ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsCustom.secondaryBlack[400],
                          ),
                          blankSpace: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (provider.statePage ==
                          PrediksiBolaPageEnum.hariini) ...[
                        if (provider.isLoadingHariIni) ...[
                          const PlaceholderCard(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceholderCard(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceholderCard(),
                        ] else ...[
                          if (provider.listBolaHariIni.isEmpty) ...[
                            const SizedBox(
                              height: 40,
                            ),
                            Lottie.asset(
                              'assets/lottie/empty.json',
                              width: width - 40,
                            ),
                            const TextCustom(
                              text: "Belum ada prediksi",
                              type: TextEnum.HEADLINE5,
                            ),
                          ],
                          for (var value in provider.listBolaHariIni) ...[
                            CardPrediksiBola(value: value),
                          ]
                        ],
                      ],
                      if (provider.statePage ==
                          PrediksiBolaPageEnum.success) ...[
                        if (provider.isLoadingSuccess) ...[
                          const PlaceholderCard(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceholderCard(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceholderCard(),
                        ] else ...[
                          if (provider.listBolaSuccess.isEmpty) ...[
                            const SizedBox(
                              height: 40,
                            ),
                            Lottie.asset(
                              'assets/lottie/empty.json',
                              width: width - 40,
                            ),
                            const TextCustom(
                              text: "Belum ada prediksi",
                              type: TextEnum.HEADLINE5,
                            ),
                          ],
                          for (var value in provider.listBolaSuccess) ...[
                            CardPrediksiBola(value: value),
                          ]
                        ]
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
