import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/assets_list.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/togel/ui/togel_view.dart';
import 'package:trading_journal/widgets/card_with_image.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../utils/colors.dart';
import '../../../widgets/placeholder_card.dart';
import '../../ads_controlling/provider/ads_controlling_provider.dart';
import '../../home/ui/home_view.dart';
import '../provider/menu_togel_provider.dart';

class MenuTogelView extends StatefulWidget {
  const MenuTogelView({super.key});

  @override
  State<MenuTogelView> createState() => _MenuTogelViewState();
}

class _MenuTogelViewState extends State<MenuTogelView> {
  Timer? timer;
  Future init() async {
    final provider = Provider.of<MenuTogelProvider>(context, listen: false);
    provider.clearData();
    provider.getListMenuTogel(context: context);

    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Menu Togel",
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
              text: "Menu Togel",
              type: TextEnum.HEADLINE5,
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Consumer<MenuTogelProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    if (provider.isLoading) ...[
                      const PlaceholderCard(),
                      const PlaceholderCard(),
                      const PlaceholderCard(),
                      const PlaceholderCard(),
                      const PlaceholderCard(),
                    ] else ...[
                      CardWithImage(
                        assetsUrl: AssetsList.togel.name,
                        title: "Prediksi Togel",
                        subtitle: "List Prediksi Togel",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TogelView(),
                            ),
                          );
                        },
                      ),
                      for (var value in provider.listMenu) ...[
                        CardWithImage(
                          img: value.img ?? "",
                          title: value.title ?? "",
                          subtitle: value.subtitle ?? "",
                          onTap: () async {
                            timer?.cancel();
                            await provider
                                .openLink(value.linkClick ?? "", context)
                                .then((value) async {
                              final providerAds =
                                  Provider.of<AdsControllingProvider>(
                                context,
                                listen: false,
                              );
                              timer = providerAds.getTimer(
                                buildContext: context,
                                screenName: "Menu Togel",
                              );
                            });
                          },
                        )
                      ]
                    ]
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
