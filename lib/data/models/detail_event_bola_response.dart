import 'package:intl/intl.dart';

class DetailEventBolaResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  DetailEventBola? data;

  DetailEventBolaResponse({this.errorString, this.inputerror, this.message, this.status, this.data});

  DetailEventBolaResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DetailEventBola.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_string'] = this.errorString;
    data['inputerror'] = this.inputerror;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DetailEventBola {
  ActiveEvent? activeEvent;
  List<History>? history;

  DetailEventBola({this.activeEvent, this.history});

  DetailEventBola.fromJson(Map<String, dynamic> json) {
    activeEvent = json['active_event'] != null ? new ActiveEvent.fromJson(json['active_event']) : null;
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activeEvent != null) {
      data['active_event'] = this.activeEvent!.toJson();
    }
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveEvent {
  String? idEventBola;
  String? active;
  String? createdDate;
  String? linkImgHome;
  String? linkImgAway;
  String? nameHome;
  String? nameAway;
  String? runningText;
  String? persyaratan;
  String? isDone;
  String? jadwalTanding;
  MyComment? myComment;

  ActiveEvent(
      {this.idEventBola,
      this.active,
      this.createdDate,
      this.linkImgHome,
      this.linkImgAway,
      this.nameHome,
      this.nameAway,
      this.runningText,
      this.persyaratan,
      this.isDone,
      this.jadwalTanding,
      this.myComment});

  ActiveEvent.fromJson(Map<String, dynamic> json) {
    idEventBola = json['id_event_bola'];
    active = json['active'];
    createdDate = json['created_date'];
    linkImgHome = json['link_img_home'];
    linkImgAway = json['link_img_away'];
    nameHome = json['name_home'];
    nameAway = json['name_away'];
    runningText = json['running_text'];
    persyaratan = json['persyaratan'];
    isDone = json['is_done'];
    jadwalTanding = json['jadwal_tanding'];
    myComment = json['my_comment'] != null ? new MyComment.fromJson(json['my_comment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_event_bola'] = this.idEventBola;
    data['active'] = this.active;
    data['created_date'] = this.createdDate;
    data['link_img_home'] = this.linkImgHome;
    data['link_img_away'] = this.linkImgAway;
    data['name_home'] = this.nameHome;
    data['name_away'] = this.nameAway;
    data['running_text'] = this.runningText;
    data['persyaratan'] = this.persyaratan;
    data['is_done'] = this.isDone;
    data['jadwal_tanding'] = this.jadwalTanding;
    if (this.myComment != null) {
      data['my_comment'] = this.myComment!.toJson();
    }
    return data;
  }

  String get jadwalTandingString {
    DateTime formattedDate = DateTime.tryParse(this.jadwalTanding ?? "") ?? DateTime.now();
    final DateFormat formatter = DateFormat('EEE dd-MM-yyyy H:m');
    final String formatted = formatter.format(formattedDate);

    return formatted;
  }
}

class MyComment {
  String? idMemberEventBola;
  String? idMember;
  String? comment;
  String? createdDate;
  String? noHp;
  Null? idWinnerEventBola;

  MyComment({this.idMemberEventBola, this.idMember, this.comment, this.createdDate, this.noHp, this.idWinnerEventBola});

  MyComment.fromJson(Map<String, dynamic> json) {
    idMemberEventBola = json['id_member_event_bola'];
    idMember = json['id_member'];
    comment = json['comment'];
    createdDate = json['created_date'];
    noHp = json['no_hp'];
    idWinnerEventBola = json['id_winner_event_bola'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_member_event_bola'] = this.idMemberEventBola;
    data['id_member'] = this.idMember;
    data['comment'] = this.comment;
    data['created_date'] = this.createdDate;
    data['no_hp'] = this.noHp;
    data['id_winner_event_bola'] = this.idWinnerEventBola;
    return data;
  }
}

class History {
  String? idEventBola;
  String? active;
  String? createdDate;
  String? linkImgHome;
  String? linkImgAway;
  String? nameHome;
  String? nameAway;
  String? runningText;
  String? persyaratan;
  String? isDone;
  String? jadwalTanding;
  List<Winner>? winner;

  History(
      {this.idEventBola,
      this.active,
      this.createdDate,
      this.linkImgHome,
      this.linkImgAway,
      this.nameHome,
      this.nameAway,
      this.runningText,
      this.persyaratan,
      this.isDone,
      this.jadwalTanding,
      this.winner});

  History.fromJson(Map<String, dynamic> json) {
    idEventBola = json['id_event_bola'];
    active = json['active'];
    createdDate = json['created_date'];
    linkImgHome = json['link_img_home'];
    linkImgAway = json['link_img_away'];
    nameHome = json['name_home'];
    nameAway = json['name_away'];
    runningText = json['running_text'];
    persyaratan = json['persyaratan'];
    isDone = json['is_done'];
    jadwalTanding = json['jadwal_tanding'];
    if (json['winner'] != null) {
      winner = <Winner>[];
      json['winner'].forEach((v) {
        winner!.add(new Winner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_event_bola'] = this.idEventBola;
    data['active'] = this.active;
    data['created_date'] = this.createdDate;
    data['link_img_home'] = this.linkImgHome;
    data['link_img_away'] = this.linkImgAway;
    data['name_home'] = this.nameHome;
    data['name_away'] = this.nameAway;
    data['running_text'] = this.runningText;
    data['persyaratan'] = this.persyaratan;
    data['is_done'] = this.isDone;
    data['jadwal_tanding'] = this.jadwalTanding;
    if (this.winner != null) {
      data['winner'] = this.winner!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get jadwalTandingString {
    DateTime formattedDate = DateTime.tryParse(this.jadwalTanding ?? "") ?? DateTime.now();
    final DateFormat formatter = DateFormat('EEE dd-MM-yyyy H:m');
    final String formatted = formatter.format(formattedDate);

    return formatted;
  }
}

class Winner {
  String? idWinnerEventBola;
  String? noHp;

  Winner({this.idWinnerEventBola, this.noHp});

  Winner.fromJson(Map<String, dynamic> json) {
    idWinnerEventBola = json['id_winner_event_bola'];
    noHp = json['no_hp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_winner_event_bola'] = this.idWinnerEventBola;
    data['no_hp'] = this.noHp;
    return data;
  }
}
