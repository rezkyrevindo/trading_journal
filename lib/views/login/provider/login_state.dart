import 'package:flutter/material.dart';

import '../../../data/models/list_promotion_response.dart';

class LoginState with ChangeNotifier {
  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  final List<ListPromotion> _listPromotion = [];
  List<ListPromotion> get listPromotion => _listPromotion;
  set listPromotion(List<ListPromotion> value) {
    _listPromotion.clear();
    _listPromotion.addAll(value);
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isLoadingPromotion = false;
  bool get isLoadingPromotion => _isLoadingPromotion;
  set isLoadingPromotion(bool value) {
    _isLoadingPromotion = value;
    notifyListeners();
  }
}
