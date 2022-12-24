import 'package:intl/intl.dart';

class ListPredictionBolaResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListPredictionBola>? data;

  ListPredictionBolaResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListPredictionBolaResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListPredictionBola>[];
      json['data'].forEach((v) {
        data!.add(new ListPredictionBola.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_string'] = this.errorString;
    data['inputerror'] = this.inputerror;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPredictionBola {
  String? idPrediction;
  String? tanggal;
  String? leagueName;
  String? homeTeam;
  String? awayTeam;
  String? comment;
  String? status;
  String? score;
  String? kategori;

  ListPredictionBola(
      {this.idPrediction,
      this.tanggal,
      this.leagueName,
      this.homeTeam,
      this.awayTeam,
      this.comment,
      this.status,
      this.score,
      this.kategori});

  ListPredictionBola.fromJson(Map<String, dynamic> json) {
    idPrediction = json['id_prediction'];
    tanggal = json['tanggal'];
    leagueName = json['league_name'];
    homeTeam = json['home_team'];
    awayTeam = json['away_team'];
    comment = json['comment'];
    status = json['status'];
    score = json['score'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_prediction'] = this.idPrediction;
    data['tanggal'] = this.tanggal;
    data['league_name'] = this.leagueName;
    data['home_team'] = this.homeTeam;
    data['away_team'] = this.awayTeam;
    data['comment'] = this.comment;
    data['status'] = this.status;
    data['score'] = this.score;
    data['kategori'] = this.kategori;
    return data;
  }

  String get homeTeamString {
    final list = this.homeTeam?.split(' ') ?? [];
    String returnValue = "";
    if (list.isNotEmpty && list.length == 1) {
      returnValue = this.homeTeam ?? "";
    } else {
      for (int i = 0; i < list.length; i++) {
        returnValue = returnValue + list[i];
        if (i < (list.length - 1)) {
          returnValue = returnValue + "\n";
        }
      }
    }
    return returnValue;
  }

  String get awayTeamString {
    final list = this.awayTeam?.split(' ') ?? [];
    String returnValue = "";
    if (list.isNotEmpty && list.length == 1) {
      returnValue = this.homeTeam ?? "";
    } else {
      for (int i = 0; i < list.length; i++) {
        returnValue = returnValue + list[i];
        if (i < (list.length - 1)) {
          returnValue = returnValue + "\n";
        }
      }
    }
    return returnValue;
  }

  String get tanggalString {
    DateTime formattedDate =
        DateTime.tryParse(this.tanggal ?? "") ?? DateTime.now();
    final DateFormat formatter = DateFormat('EEE dd-MM-yyyy H:m');
    final String formatted = formatter.format(formattedDate);

    return formatted;
  }
}
