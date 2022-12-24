import 'package:flutter/material.dart';
import 'package:trading_journal/data/repository/prediction/prediction_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';

import 'togel_event.dart';
import 'togel_state.dart';

class TogelProvider extends TogelState implements TogelEvent {
  @override
  void clearData() {
    isLoading = false;
    listTogel.clear();
  }

  @override
  Future getListTogel({required BuildContext context}) async {
    isLoading = true;
    final PredictionRepositoriesImpl promoRepo = PredictionRepositoriesImpl();
    final result = await promoRepo.listTogel();
    isLoading = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listTogel = r?.data ?? [];
      }
    });
  }
}
