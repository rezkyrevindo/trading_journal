import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/assets_list.dart';
import 'package:trading_journal/views/ads_controlling/provider/ads_controlling_provider.dart';
import 'package:trading_journal/views/detail_promotion/detail_promotion_view.dart';
import 'package:trading_journal/views/home/ui/inner_widget/welcome_board_view.dart';
import 'package:trading_journal/widgets/placeholder_card.dart';

import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../../../utils/text_enum.dart';
import '../../../widgets/cache_image_network.dart';
import '../../../widgets/card_with_image.dart';
import '../../../widgets/text.dart';
import '../provider/home_provider.dart';
import 'inner_widget/menu_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Timer? timer;
  Future init() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.clearData();
    provider.getListPromotion(context: context);
    provider.getListAds(context: context);
    final providerAds =
        Provider.of<AdsControllingProvider>(context, listen: false);
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Home",
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    setState(() {});
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
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsCustom.mainColor,
        body: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return SizedBox(
              height: height,
              width: width,
              child: RefreshIndicator(
                onRefresh: () async {
                  final provider =
                      Provider.of<HomeProvider>(context, listen: false);
                  provider.clearData();
                  provider.getListPromotion(context: context);
                  provider.getListAds(context: context);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextCustom(
                                        text: Strings.title,
                                        type: TextEnum.HEADLINE4,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (!provider.isLoading) {
                                        provider.openCSChat();
                                      }
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AssetsList.icChat.name,
                                          width: 32,
                                          height: 32,
                                          color: Colors.white,
                                        ),
                                        const TextCustom(
                                          text: "Live Chat",
                                          type: TextEnum.CAPTION,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: width,
                                child: provider.isLoadingPromotion
                                    ? Column(
                                        children: const [
                                          PlaceholderCard(),
                                        ],
                                      )
                                    : CarouselSlider(
                                        options: CarouselOptions(
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                        ),
                                        items: provider.listPromotion.map((i) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailPromotionView(
                                                        content: i,
                                                        from: "Home",
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: ColorsCustom
                                                        .secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      30,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 7.5,
                                                        color: ColorsCustom
                                                            .secondaryBlack,
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    child:
                                                        CacheImageNetworkCustom(
                                                      img: i.img ?? "",
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: ColorsCustom.secondaryBlack[300] ??
                                  Colors.black,
                            ),
                          ],
                          border: Border.all(
                            width: 0,
                            color: ColorsCustom.secondaryBlack[300] ??
                                Colors.black,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WelcomeBoardView(
                              provider: provider,
                            ),
                            const MenuHomeView(),
                            if (provider.isLoadingAds) ...[
                              const PlaceholderCard(),
                              const PlaceholderCard(),
                              const PlaceholderCard(),
                            ] else ...[
                              for (var value in provider.listAds) ...[
                                CardWithImage(
                                  img: value.img ?? "",
                                  title: value.title ?? "",
                                  subtitle: value.subtitle ?? "",
                                )
                              ],
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
