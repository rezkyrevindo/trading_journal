import 'package:flutter/material.dart';

import '../../../data/models/list_game_response.dart';

class SlotState with ChangeNotifier {
  final List<ListGame> _listSlot = [];
  List<ListGame> get listSlot => _listSlot;
  set listSlot(List<ListGame> value) {
    _listSlot.clear();
    _listSlot.addAll(value);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
