// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/data/repository/contact/contact_repositories_impl.dart';
import 'package:trading_journal/data/repository/setting/setting_repositories_impl.dart';
import 'package:trading_journal/utils/assets_list.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/home/provider/home_provider.dart';
import 'package:trading_journal/views/home/ui/home_view.dart';
import 'package:trading_journal/widgets/text.dart';

import '../../data/models/contact_response.dart';
import '../../data/models/list_setting_response.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/strings.dart';
import '../login/ui/login_view.dart';

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
    final SettingRepositoriesImpl settingRepo = SettingRepositoriesImpl();
    final ContactRepositoriesImpl contactRepo = ContactRepositoriesImpl();
    setState(() {
      message = "Sedang melakukan pengecekan data";
    });
    final result = await settingRepo.listSetting();

    result.fold((l) async {
      if (await SecureStorageUtils.getRunningText() == null) {
        setState(() {
          message = "Gagal mengambil data, mengulangi kembali.";
        });
        await Future.delayed(const Duration(seconds: 1));
        await init();
      }
    }, (r) async {
      final ListSetting? setting = r?.data?[0];
      if (setting != null) {
        await SecureStorageUtils.setRunningText(
          setting.runningText ?? "",
        );
        await SecureStorageUtils.setLinkKlikPopUp(
          setting.linkKlikPopup ?? "",
        );
        await SecureStorageUtils.setPopUp(
          setting.popup ?? "",
        );
        await SecureStorageUtils.setRules(
          setting.rules ?? "",
        );
        await SecureStorageUtils.setIdLiveChat(
          setting.idLivechat ?? "",
        );
      } else {
        setState(() {
          message = "Gagal mengambil data, mengulangi kembali.";
        });
        await Future.delayed(const Duration(seconds: 1));
        await init();
      }
    });
    final resultContact = await contactRepo.listContact();

    resultContact.fold((l) async {
      if (await SecureStorageUtils.getRunningText() == null) {
        setState(() {
          message = "Gagal mengambil data, mengulangi kembali.";
        });
        await Future.delayed(const Duration(seconds: 1));
        await init();
      }
    }, (r) async {
      final List<ContactModel>? listKontak = r?.data;
      if (listKontak != null) {
        Provider.of<HomeProvider>(context, listen: false).listContact =
            listKontak;
      } else {
        setState(() {
          message = "Gagal mengambil data, mengulangi kembali.";
        });
        await Future.delayed(const Duration(seconds: 1));
        await init();
      }
    });
  }
}
