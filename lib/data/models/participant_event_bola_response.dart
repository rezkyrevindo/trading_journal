import 'package:intl/intl.dart';

class ParticipantEventBolaResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ParticipantEventBola>? data;

  ParticipantEventBolaResponse({
    this.errorString,
    this.inputerror,
    this.message,
    this.status,
    this.data,
  });

  ParticipantEventBolaResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'] as String?;
    status = json['status'] as int?;
    if (json['data'] != null) {
      data = <ParticipantEventBola>[];
      for (final v in json['data']) {
        data!.add(ParticipantEventBola.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_string'] = errorString;
    data['inputerror'] = inputerror;
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParticipantEventBola {
  String? idMemberEventBola;
  String? idMember;
  String? comment;
  String? createdDate;
  String? noHp;
  String? idWinnerEventBola;

  ParticipantEventBola({
    this.idMemberEventBola,
    this.idMember,
    this.comment,
    this.createdDate,
    this.noHp,
    this.idWinnerEventBola,
  });

  ParticipantEventBola.fromJson(Map<String, dynamic> json) {
    idMemberEventBola = json['id_member_event_bola'];
    idMember = json['id_member'];
    comment = json['comment'];
    createdDate = json['created_date'];
    noHp = json['no_hp'];
    idWinnerEventBola = json['id_winner_event_bola'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_member_event_bola'] = idMemberEventBola;
    data['id_member'] = idMember;
    data['comment'] = comment;
    data['created_date'] = createdDate;
    data['no_hp'] = noHp;
    data['id_winner_event_bola'] = idWinnerEventBola;
    return data;
  }

  String get createdDateString {
    DateTime formattedDate = DateTime.tryParse(this.createdDate ?? "") ?? DateTime.now();
    final DateFormat formatter = DateFormat('EEE dd-MM-yyyy H:m');
    final String formatted = formatter.format(formattedDate);

    return formatted;
  }
}
