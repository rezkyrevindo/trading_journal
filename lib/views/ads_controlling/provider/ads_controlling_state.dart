import 'dart:async';

import 'package:flutter/material.dart';

class AdsControllingState with ChangeNotifier {
  BuildContext? _context;
  BuildContext? get context => _context;
  set context(BuildContext? value) {
    _context = value;
    notifyListeners();
  }

  Timer? _timer;
  Timer? get timer => _timer;
  set timer(Timer? value) {
    _timer = value;
    notifyListeners();
  }

  bool _isDialogPop = false;
  bool get isDialogPop => _isDialogPop;
  set isDialogPop(bool value) {
    _isDialogPop = value;
    notifyListeners();
  }

  String _titleScreen = "";
  String get titleScreen => _titleScreen;
  set titleScreen(String value) {
    _titleScreen = value;
    notifyListeners();
  }

  DateTime? _dateTimeSaved;
  DateTime? get dateTimeSaved => _dateTimeSaved;
  set dateTimeSaved(DateTime? value) {
    _dateTimeSaved = value;
    notifyListeners();
  }
}
