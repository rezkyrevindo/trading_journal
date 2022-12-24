import 'package:flutter/material.dart';
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';

class AlertFunction {
  // ignore: long-parameter-list
  static void yesNoSmartAlert({
    required BuildContext context,
    required String title,
    required String message,
    required Function()? onConfirmPressed,
    required Function()? onCancelPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => SmartAlertDialog(
        title: title,
        text: AlertDialogText(),
        message: message,
        onConfirmPressed: onConfirmPressed,
        onCancelPressed: onCancelPressed,
      ),
    );
  }

  static void okSmartAlert({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (_) => SmartAlertDialog(
        title: title,
        text: AlertDialogText(),
        message: message,
        isDismissible: true,
      ),
    );
  }
}
