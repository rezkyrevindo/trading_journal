import 'package:flutter/material.dart';

import '../../../data/models/list_togel_response.dart';

class TogelState with ChangeNotifier {
  final List<ListTogel> _listTogel = [];
  List<ListTogel> get listTogel => _listTogel;
  set listTogel(List<ListTogel> value) {
    _listTogel.clear();
    _listTogel.addAll(value);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
