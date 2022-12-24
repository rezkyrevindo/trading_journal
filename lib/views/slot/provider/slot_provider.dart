import 'package:flutter/material.dart';
import 'package:trading_journal/data/repository/slot/slot_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';

import '../../../widgets/webview.dart';
import 'slot_event.dart';
import 'slot_state.dart';

class SlotProvider extends SlotState implements SlotEvent {
  @override
  void clearData() {
    isLoading = false;
    listSlot.clear();
  }

  @override
  Future getListSlot({
    required BuildContext context,
  }) async {
    isLoading = true;
    final SlotRepositoriesImpl promoRepo = SlotRepositoriesImpl();
    final result = await promoRepo.listGame();
    isLoading = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listSlot = r?.data ?? [];
      }
    });
  }
}
