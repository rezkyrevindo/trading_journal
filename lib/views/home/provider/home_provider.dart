import 'package:flutter/material.dart';
import 'package:livechatt/livechatt.dart';
import 'package:logger/logger.dart';
import 'package:trading_journal/data/repository/ads/ads_repositories_impl.dart';
import 'package:trading_journal/data/repository/promotion/promotion_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/views/login/ui/login_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../widgets/cache_image_network.dart';
import '../../../widgets/text.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeProvider extends HomeState implements HomeEvent {
  @override
  Future<void> clearData() async {
    isLoading = false;
    noHp = await SecureStorageUtils.getNoHp() ?? "";
    runningText = await SecureStorageUtils.getRunningText() ?? "";
  }

  @override
  Future getListPromotion({
    required BuildContext context,
  }) async {
    listPromotion.clear();
    isLoadingPromotion = true;
    final PromotionRepositoriesImpl promoRepo = PromotionRepositoriesImpl();
    final result = await promoRepo.listPromotion();
    isLoadingPromotion = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r.data ?? []).isNotEmpty) {
        listPromotion = r.data ?? [];
      }
    });
  }

  @override
  Future openCSChat() async {
    final String idLiveChat = await SecureStorageUtils.getIdLiveChat() ?? "";
    isLoading = true;
    await Livechat.beginChat(
      idLiveChat,
      "0",
      noHp,
      "Guest",
    );
    isLoading = false;
  }

  @override
  Future logout({
    required BuildContext context,
  }) async {
    await SecureStorageUtils.setToken(
      "",
    );
    await SecureStorageUtils.setNoHp(
      "",
    );

    clearData();
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
      (route) => false,
    );
  }

  @override
  Future getListAds({required BuildContext context}) async {
    listAds.clear();
    isLoadingAds = true;
    final AdsRepositoriesImpl repo = AdsRepositoriesImpl();
    final result = await repo.listAds();
    isLoadingAds = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listAds = r?.data ?? [];
      }
    });
  }

  @override
  // ignore: long-method
  void showBantuan(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 40,
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          maxChildSize: 0.8,
          minChildSize: 0.6,
          initialChildSize: 0.8,
          expand: false,
          builder: (_, controller) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView(
                controller: controller,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 6,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCED6E0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TextCustom(
                    text: 'Customer Service',
                    type: TextEnum.HEADLINE6,
                  ),
                  ...listContact.map(
                    (value) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (value.namaContact == "Whatsapp") {
                              waNow(context, value.contact ?? "");
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CacheImageNetworkCustom(
                                    height: 40,
                                    width: 40,
                                    img: value.logo ?? "",
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextCustom(
                                      text: value.namaContact ?? "",
                                      type: TextEnum.CAPTION,
                                    ),
                                    TextCustom(
                                      text: value.contact ?? "",
                                      type: TextEnum.LABEL,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(thickness: 2),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          ColorsCustom.mainColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                      child: const TextCustom(
                        text: 'Tutup',
                        type: TextEnum.BUTTON2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> waNow(BuildContext context, String noWa) async {
    try {
      String formattedPhoneNumber;
      if (noWa[0] == '0') {
        formattedPhoneNumber = noWa.replaceFirst('0', '62');
      } else {
        formattedPhoneNumber = noWa;
      }
      if (formattedPhoneNumber.startsWith("+")) {
        formattedPhoneNumber = formattedPhoneNumber.replaceRange(0, 1, "");
      }

      final String url = "whatsapp://send?phone=$formattedPhoneNumber";
      if (!(await launchUrlString(
        url,
      ))) {
        AlertFunction.okSmartAlert(
          context: context,
          title: "Warning",
          message:
              "Kamu tidak punya Whatsapp, silahkan install terlebih dahulu",
        );
      }
      // ignore: empty_catches
    } catch (e) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: "Kamu tidak punya Whatsapp, silahkan install terlebih dahulu",
      );
      Logger().e(e);
    }
  }
}
