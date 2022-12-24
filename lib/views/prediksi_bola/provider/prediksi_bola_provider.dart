import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:trading_journal/data/repository/prediction/prediction_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/utils/prediksi_bola_page_enum.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';

import 'prediksi_bola_event.dart';
import 'prediksi_bola_state.dart';

class PrediksiBolaProvider extends PrediksiBolaState
    implements PrediksiBolaEvent {
  @override
  Future clearData() async {
    isLoadingHariIni = false;
    listBolaHariIni.clear();
    isLoadingSuccess = false;
    listBolaSuccess.clear();
    statePage = PrediksiBolaPageEnum.hariini;
    runningText = await SecureStorageUtils.getRunningText() ?? "";
  }

  @override
  Future getListBolaBesar({required BuildContext context}) async {
    isLoadingHariIni = true;
    final PredictionRepositoriesImpl promoRepo = PredictionRepositoriesImpl();
    final result = await promoRepo.prediksiBolaBesar();
    isLoadingHariIni = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) async {
      if ((r?.data ?? []).isNotEmpty) {
        listBolaHariIni.addAll(r?.data ?? []);
        getListBolaKecil(context: context);
      }
    });
  }

  @override
  Future getListBolaKecil({required BuildContext context}) async {
    isLoadingHariIni = true;
    final PredictionRepositoriesImpl promoRepo = PredictionRepositoriesImpl();
    final result = await promoRepo.prediksiBolaKecil();
    isLoadingHariIni = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listBolaHariIni.addAll(r?.data ?? []);
      }
    });
  }

  @override
  Future getListBolaSuccess({required BuildContext context}) async {
    isLoadingSuccess = true;
    final PredictionRepositoriesImpl promoRepo = PredictionRepositoriesImpl();
    final result = await promoRepo.prediksiBolaSukses();
    isLoadingSuccess = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listBolaSuccess = r?.data ?? [];
        listBolaSuccess.sort((a, b) {
          final DateTime aDate = DateTime.parse(a.tanggal ?? "");
          final DateTime bDate = DateTime.parse(basename(b.tanggal ?? ""));
          return aDate.compareTo(bDate);
        });
      }
    });
  }
}
