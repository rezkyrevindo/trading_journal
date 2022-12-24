import 'package:flutter/material.dart';
import 'package:trading_journal/data/repository/menu_togel/menu_togel_repositories_impl.dart';
import 'package:trading_journal/utils/alert_function.dart';

import '../../../widgets/webview.dart';
import 'menu_togel_event.dart';
import 'menu_togel_state.dart';

class MenuTogelProvider extends MenuTogelState implements MenuTogelEvent {
  @override
  void clearData() {
    isLoading = false;
    listMenu.clear();
  }

  @override
  Future getListMenuTogel({
    required BuildContext context,
  }) async {
    isLoading = true;
    final MenuTogelRepositoriesImpl repo = MenuTogelRepositoriesImpl();
    final result = await repo.listMenuTogel();
    isLoading = false;
    result.fold((l) {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: l.message,
      );
    }, (r) {
      if ((r?.data ?? []).isNotEmpty) {
        listMenu = r?.data ?? [];
      }
    });
  }

  @override
  Future openLink(
    String link,
    BuildContext context,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewDsiplay(
          link: link,
        ),
      ),
    );
  }
}
