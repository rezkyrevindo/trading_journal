import 'package:flutter/material.dart';

import '../../../data/models/detail_event_bola_response.dart';
import '../../../data/models/participant_event_bola_response.dart';

class DetailEventState with ChangeNotifier {
  DetailEventBola? _detailEventBola;
  DetailEventBola? get detailEventBola => _detailEventBola;
  set detailEventBola(DetailEventBola? value) {
    _detailEventBola = value;
    notifyListeners();
  }

  List<ParticipantEventBola> _participantEventBola = [];
  List<ParticipantEventBola> get participantEventBola => _participantEventBola;
  set participantEventBola(List<ParticipantEventBola> value) {
    _participantEventBola = value;
    notifyListeners();
  }

  bool _isLoadingDetailEvent = false;
  bool get isLoadingDetailEvent => _isLoadingDetailEvent;
  set isLoadingDetailEvent(bool value) {
    _isLoadingDetailEvent = value;
    notifyListeners();
  }

  bool _isLoadingParticipant = false;
  bool get isLoadingParticipant => _isLoadingParticipant;
  set isLoadingParticipant(bool value) {
    _isLoadingParticipant = value;
    notifyListeners();
  }

  TextEditingController _comment = TextEditingController();
  TextEditingController get comment => _comment;
  set comment(TextEditingController value) {
    _comment = value;
    notifyListeners();
  }
}
