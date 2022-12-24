import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../utils/colors.dart';
import '../../../widgets/cache_image_network.dart';
import '../../../widgets/placeholder_card.dart';
import '../../../widgets/webview.dart';
import '../../ads_controlling/provider/ads_controlling_provider.dart';
import '../../home/ui/home_view.dart';
import '../provider/slot_provider.dart';

class SlotView extends StatefulWidget {
  const SlotView({super.key});

  @override
  State<SlotView> createState() => _SlotViewState();
}

class _SlotViewState extends State<SlotView> {
  Timer? timer;
  Future init() async {
    final provider = Provider.of<SlotProvider>(context, listen: false);
    provider.clearData();
    provider.getListSlot(context: context);

    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Slot",
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
              text: "Games",
              type: TextEnum.HEADLINE5,
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Consumer<SlotProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: provider.isLoading
                    ? StaggeredGrid.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          9,
                          (index) {
                            return const PlaceholderCard();
                          },
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          final provider =
                              Provider.of<SlotProvider>(context, listen: false);
                          provider.clearData();
                          provider.getListSlot(context: context);
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: StaggeredGrid.count(
                            crossAxisCount: 3,
                            children: List.generate(
                              provider.listSlot.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () async {
                                    timer?.cancel();
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebViewDsiplay(
                                          link: provider.listSlot[index].link ??
                                              "",
                                        ),
                                      ),
                                    ).then((value) {
                                      final providerAds =
                                          Provider.of<AdsControllingProvider>(
                                        context,
                                        listen: false,
                                      );
                                      timer = providerAds.getTimer(
                                        buildContext: context,
                                        screenName: "Slot",
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: width,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: ColorsCustom.mainColor,
                                        ),
                                      ],
                                      border: Border.all(
                                        width: 0,
                                        color: ColorsCustom.mainColor,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: ColorsCustom.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: CacheImageNetworkCustom(
                                              img: provider
                                                      .listSlot[index].img ??
                                                  "",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextCustom(
                                          text: provider
                                                  .listSlot[index].namaGame ??
                                              "",
                                          type: TextEnum.HEADLINE6,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorsCustom.mainColor,
                                            ),
                                            color: ColorsCustom.mainColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  TextCustom(
                                                    text: "Mainkan",
                                                    type: TextEnum.BUTTON2,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
