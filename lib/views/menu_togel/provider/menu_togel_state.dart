import 'package:flutter/material.dart';

import '../../../data/models/list_menu_response.dart';

class MenuTogelState with ChangeNotifier {
  final List<ListMenu> _listMenu = [];
  List<ListMenu> get listMenu => _listMenu;
  set listMenu(List<ListMenu> value) {
    _listMenu.clear();
    _listMenu.addAll(value);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
