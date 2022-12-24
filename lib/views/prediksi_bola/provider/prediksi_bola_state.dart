import 'package:flutter/material.dart';

import '../../../data/models/list_prediction_bola_response.dart';
import '../../../utils/prediksi_bola_page_enum.dart';

class PrediksiBolaState with ChangeNotifier {
  final List<ListPredictionBola> _listBolaHariIni = [];
  List<ListPredictionBola> get listBolaHariIni => _listBolaHariIni;
  set listBolaHariIni(List<ListPredictionBola> value) {
    _listBolaHariIni.clear();
    _listBolaHariIni.addAll(value);
    notifyListeners();
  }

  final List<ListPredictionBola> _listBolaSuccess = [];
  List<ListPredictionBola> get listBolaSuccess => _listBolaSuccess;
  set listBolaSuccess(List<ListPredictionBola> value) {
    _listBolaSuccess.clear();
    _listBolaSuccess.addAll(value);
    notifyListeners();
  }

  bool _isLoadingHariIni = false;
  bool get isLoadingHariIni => _isLoadingHariIni;
  set isLoadingHariIni(bool value) {
    _isLoadingHariIni = value;
    notifyListeners();
  }

  String _runningText = "";
  String get runningText => _runningText;
  set runningText(String value) {
    _runningText = value;
    notifyListeners();
  }

  bool _isLoadingSuccess = false;
  bool get isLoadingSuccess => _isLoadingSuccess;
  set isLoadingSuccess(bool value) {
    _isLoadingSuccess = value;
    notifyListeners();
  }

  PrediksiBolaPageEnum _statePage = PrediksiBolaPageEnum.hariini;
  PrediksiBolaPageEnum get statePage => _statePage;
  set statePage(PrediksiBolaPageEnum value) {
    _statePage = value;
    notifyListeners();
  }
}
