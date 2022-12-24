import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/detail_togel/detail_togel_view.dart';
import 'package:trading_journal/views/menu_togel/ui/menu_togel_view.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../utils/colors.dart';
import '../../../widgets/cache_image_network.dart';
import '../../../widgets/placeholder_card.dart';
import '../../ads_controlling/provider/ads_controlling_provider.dart';
import '../provider/togel_provider.dart';

class TogelView extends StatefulWidget {
  const TogelView({super.key});

  @override
  State<TogelView> createState() => _TogelViewState();
}

class _TogelViewState extends State<TogelView> {
  Timer? timer;
  Future init() async {
    final provider = Provider.of<TogelProvider>(context, listen: false);
    provider.clearData();
    provider.getListTogel(context: context);

    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Togel",
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
            builder: (context) => const MenuTogelView(),
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
                    builder: (context) => const MenuTogelView(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            backgroundColor: ColorsCustom.mainColor,
            centerTitle: true,
            title: const TextCustom(
              text: "Prediksi Togel",
              type: TextEnum.HEADLINE5,
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Consumer<TogelProvider>(
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
                          final provider = Provider.of<TogelProvider>(
                            context,
                            listen: false,
                          );
                          provider.clearData();
                          provider.getListTogel(context: context);
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: StaggeredGrid.count(
                            crossAxisCount: 3,
                            children: List.generate(
                              provider.listTogel.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailTogelView(
                                          togel: provider.listTogel[index],
                                        ),
                                      ),
                                    );
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
                                                      .listTogel[index].img ??
                                                  "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.centerLeft,
                                          child: TextCustom(
                                            text: provider
                                                    .listTogel[index].judul ??
                                                "",
                                            type: TextEnum.LABEL,
                                            color: Colors.black,
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
