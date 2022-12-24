import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/togel/provider/togel_provider.dart';
import 'package:trading_journal/views/togel/ui/togel_view.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../../utils/colors.dart';
import '../../data/models/list_togel_response.dart';
import '../../widgets/cache_image_network.dart';
import '../ads_controlling/provider/ads_controlling_provider.dart';

class DetailTogelView extends StatefulWidget {
  final ListTogel togel;
  const DetailTogelView({
    super.key,
    required this.togel,
  });

  @override
  State<DetailTogelView> createState() => _DetailTogelViewState();
}

class _DetailTogelViewState extends State<DetailTogelView> {
  Timer? timer;
  Future init() async {
    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "Detail Togel",
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
            builder: (context) => const TogelView(),
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
                    builder: (context) => const TogelView(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            backgroundColor: ColorsCustom.mainColor,
            centerTitle: true,
            title: const TextCustom(
              text: "Detail Togel",
              type: TextEnum.HEADLINE5,
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Consumer<TogelProvider>(
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CacheImageNetworkCustom(
                      width: width,
                      img: widget.togel.img ?? "",
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 20,
                      ),
                      child: TextCustom(
                        text: widget.togel.judul,
                        type: TextEnum.HEADLINE3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorsCustom.greyWhiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: ColorsCustom.greyMudaColor,
                          ),
                        ],
                      ),
                      child: Html(
                        data: widget.togel.content,
                      ),
                    ),
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
