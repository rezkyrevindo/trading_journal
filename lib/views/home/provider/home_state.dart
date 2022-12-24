import 'package:flutter/material.dart';

import '../../../data/models/contact_response.dart';
import '../../../data/models/list_menu_response.dart';
import '../../../data/models/list_promotion_response.dart';

class HomeState with ChangeNotifier {
  String _noHp = "";
  String get noHp => _noHp;
  set noHp(String value) {
    _noHp = value;
    notifyListeners();
  }

  String _runningText = "";
  String get runningText => _runningText;
  set runningText(String value) {
    _runningText = value;
    notifyListeners();
  }

  final List<ListPromotion> _listPromotion = [];
  List<ListPromotion> get listPromotion => _listPromotion;
  set listPromotion(List<ListPromotion> value) {
    _listPromotion.clear();
    _listPromotion.addAll(value);
    notifyListeners();
  }

  final List<ListMenu> _listAds = [];
  List<ListMenu> get listAds => _listAds;
  set listAds(List<ListMenu> value) {
    _listAds.clear();
    _listAds.addAll(value);
    notifyListeners();
  }

  final List<ContactModel> _listContact = [];
  List<ContactModel> get listContact => _listContact;
  set listContact(List<ContactModel> value) {
    _listContact.clear();
    _listContact.addAll(value);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isLoadingAds = false;
  bool get isLoadingAds => _isLoadingAds;
  set isLoadingAds(bool value) {
    _isLoadingAds = value;
    notifyListeners();
  }

  bool _isLoadingPromotion = false;
  bool get isLoadingPromotion => _isLoadingPromotion;
  set isLoadingPromotion(bool value) {
    _isLoadingPromotion = value;
    notifyListeners();
  }
}
