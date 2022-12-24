import 'package:flutter/material.dart';
import 'package:livechatt/livechatt.dart';
import 'package:trading_journal/data/repository/login/login_repositories_impl.dart';
import 'package:trading_journal/data/repository/promotion/promotion_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';
import 'package:trading_journal/views/login/provider/login_event.dart';
import 'package:trading_journal/views/rules/rules_view.dart';

import 'login_state.dart';

class LoginProvider extends LoginState implements LoginEvent {
  @override
  Future processLogin({
    required BuildContext context,
  }) async {
    isLoading = true;
    final LoginRepositoriesImpl loginRepo = LoginRepositoriesImpl();
    final result = await loginRepo.login(noHp: phoneNumber.text);

    result.fold((l) {
      isLoading = false;
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) async {
      await SecureStorageUtils.setToken(
        r?.token ?? "",
      );
      await SecureStorageUtils.setNoHp(
        r?.user?.noHp ?? "",
      );
      await SecureStorageUtils.setIdMember(
        r?.user?.idMember ?? "",
      );

      clearData();
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RulesView(),
        ),
      );
    });
  }

  @override
  void clearData() {
    isLoading = false;
    phoneNumber.text = "";
  }

  @override
  Future getListPromotion({
    required BuildContext context,
  }) async {
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
      "Guest",
      "Guest",
    );
    isLoading = false;
  }
}
