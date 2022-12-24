// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:trading_journal/utils/assets_list.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/home/provider/home_provider.dart';
import 'package:trading_journal/views/home/ui/home_view.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../utils/secure_storage_utils.dart';
import '../../utils/strings.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  late Animation _sizeLottieAnimation;
  String message = "Hallo, welcome to ${Strings.title}";
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.repeat();
    _sizeAnimation =
        Tween<double>(begin: 60.0, end: 100.0).animate(_controller);
    _sizeLottieAnimation =
        Tween<double>(begin: 160.0, end: 200.0).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await init();
      await checkingStatusLogin();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsCustom.secondaryBlack,
      child: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: _sizeLottieAnimation.value as double?,
              height: _sizeLottieAnimation.value as double?,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        AssetsList.logo.name,
                        height: _sizeAnimation.value as double?,
                        width: _sizeAnimation.value as double?,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                TextCustom(
                  text: message,
                  type: TextEnum.LABEL,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future checkingStatusLogin() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
    );
  }

  // ignore: long-method
  Future init() async {
    setState(() {
      message = "Sedang melakukan pengecekan data";
    });
  }
}
