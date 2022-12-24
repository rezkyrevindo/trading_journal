import 'package:flutter/material.dart';
import 'package:trading_journal/data/repository/event_bola/event_bola_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';
import 'detail_event_event.dart';
import 'detail_event_state.dart';

class DetailEventProvider extends DetailEventState implements DetailEventEvent {
  @override
  void clearData() {
    isLoadingDetailEvent = false;
    isLoadingParticipant = false;
    detailEventBola = null;
    participantEventBola.clear();
  }

  @override
  Future getDetailEvent({required BuildContext context}) async {
    isLoadingDetailEvent = true;
    final EventBolaRepositoriesImpl eventBolaRepo = EventBolaRepositoriesImpl();
    final String idMember = await SecureStorageUtils.getIdMember() ?? "";
    final String token = await SecureStorageUtils.getToken() ?? "";
    final result = await eventBolaRepo.detailEventBola(
      auth: token,
      idMember: idMember,
    );
    isLoadingDetailEvent = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if (r != null) {
        detailEventBola = r.data;
      } else {
        AlertFunction.okSmartAlert(
          context: context,
          title: "Warning",
          message:
              "Terdapat kesalahan ketika mengambil data dari server, mohon coba kembali",
        );
      }
    });
  }

  @override
  Future getParticipant({required BuildContext context}) async {
    isLoadingParticipant = true;
    final EventBolaRepositoriesImpl eventBolaRepo = EventBolaRepositoriesImpl();
    final String token = await SecureStorageUtils.getToken() ?? "";
    String idEventBola = "";
    if (detailEventBola?.activeEvent != null) {
      idEventBola = detailEventBola?.activeEvent?.idEventBola ?? "";
    } else if ((detailEventBola?.history ?? []).isNotEmpty) {
      idEventBola = detailEventBola?.history?[0].idEventBola ?? "";
    }

    final result = await eventBolaRepo.participantEventbola(
      auth: token,
      limit: "5",
      offset: participantEventBola.length.toString(),
      idEventBola: idEventBola,
    );
    isLoadingParticipant = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if (r != null) {
        participantEventBola.addAll(r.data ?? []);
      } else {
        AlertFunction.okSmartAlert(
          context: context,
          title: "Warning",
          message:
              "Terdapat kesalahan ketika mengambil data dari server, mohon coba kembali",
        );
      }
    });
  }

  @override
  Future saveComment({required BuildContext context}) async {
    isLoadingDetailEvent = true;
    final EventBolaRepositoriesImpl eventBolaRepo = EventBolaRepositoriesImpl();
    final String token = await SecureStorageUtils.getToken() ?? "";
    String idEventBola = "";
    if (detailEventBola?.activeEvent != null) {
      idEventBola = detailEventBola?.activeEvent?.idEventBola ?? "";
    } else if ((detailEventBola?.history ?? []).isNotEmpty) {
      idEventBola = detailEventBola?.history?[0].idEventBola ?? "";
    }

    final result = await eventBolaRepo.comment(
      auth: token,
      comment: comment.text,
      idMember: await SecureStorageUtils.getIdMember() ?? "",
      idEventBola: idEventBola,
    );
    isLoadingDetailEvent = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) async {
      if (r?.status == 200) {
        clearData();
        await getDetailEvent(context: context);
        getParticipant(context: context);
        AlertFunction.okSmartAlert(
          context: context,
          title: "Berhasil",
          message:
              "Berhasil menambahkan komentar. Silahkan tunggu pengumuman pemenang",
        );
      } else {
        AlertFunction.okSmartAlert(
          context: context,
          title: "Warning",
          message: r?.message ??
              "Terdapat kesalahan ketika menyimpan komentar. Silahkan ulangi kembali",
        );
      }
    });
  }
}
