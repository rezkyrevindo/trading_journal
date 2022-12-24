import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../views/ads_controlling/provider/ads_controlling_provider.dart';

class WebViewDsiplay extends StatefulWidget {
  final String link;
  const WebViewDsiplay({required this.link});

  @override
  WebViewDsiplayState createState() => WebViewDsiplayState();
}

class WebViewDsiplayState extends State<WebViewDsiplay> {
  Timer? timer;

  Future init() async {
    final providerAds = Provider.of<AdsControllingProvider>(
      context,
      listen: false,
    );
    timer = providerAds.getTimer(
      buildContext: context,
      screenName: "WebView",
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: ColorsCustom.mainColor,
      ),
      body: WebView(
        initialUrl: widget.link,
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
      ),
    );
  }
}
