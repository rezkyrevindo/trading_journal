import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';
import '../../../utils/strings.dart';
import '../view/pop_up_dialog_ads.dart';
import 'ads_controlling_event.dart';
import 'ads_controlling_state.dart';

class AdsControllingProvider extends AdsControllingState
    implements AdsControllingEvent {
  @override
  void clearData() {
    context = null;
    isDialogPop = false;
    timer = null;
  }

  @override
  Timer? getTimer({
    required BuildContext buildContext,
    required String screenName,
  }) {
    titleScreen = screenName;
    context = buildContext;
    return timer = Timer.periodic(const Duration(seconds: 10), (Timer t) async {
      if (dateTimeSaved == null) {
        Logger().e("Masuk ke pengecekan null");
        if (await SecureStorageUtils.getTimePopUp() == null) {
          final DateTime now = DateTime.now();
          dateTimeSaved = DateTime(
            now.year,
            now.month,
            now.day,
            now.hour,
            now.minute,
            now.second,
          );
          await SecureStorageUtils.setTimePopUp(dateTimeSaved.toString());
        } else {
          dateTimeSaved = DateTime.tryParse(
                await SecureStorageUtils.getTimePopUp() ?? "",
              ) ??
              DateTime.now();
        }
      }

      Logger().e(dateTimeSaved);
      final Duration diff =
          DateTime.now().difference(dateTimeSaved ?? DateTime.now());
      Logger().e(diff.inSeconds);
      if (diff.inSeconds >= (Strings.TIME_POPUPS * 60)) {
        if (context != null) {
          displayDialog(
            context: context!,
          );
        }
      }
    });
  }

  @override
  Future displayDialog({required BuildContext context}) async {
    final linkImg = await SecureStorageUtils.getPopUp();
    final linkKlik = await SecureStorageUtils.getLinkKlikPopUp();

    if (!isDialogPop) {
      final DateTime now = DateTime.now();
      final DateTime time = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );
      SecureStorageUtils.setTimePopUp(time.toString());
      dateTimeSaved = time;
      Logger().e(time);
      Logger().e("display popup from : $titleScreen");
      isDialogPop = true;
      await showDialog(
        context: context,
        builder: (_) => PopUpDialogAds(
          linkImg: linkImg ?? "",
          linkOnClick: linkKlik ?? "",
        ),
      ).then((value) => isDialogPop = false);
    } else {
      Logger().e("tidak bisa display popup from : $titleScreen");
    }
  }
}
