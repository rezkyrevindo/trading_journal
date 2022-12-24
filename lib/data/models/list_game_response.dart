class ListGameResponse {
  String? message;
  List<ListGame>? data;
  int? status;

  ListGameResponse({this.message, this.data, this.status});

  ListGameResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ListGame>[];
      json['data'].forEach((v) {
        data!.add(new ListGame.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ListGame {
  String? idGame;
  String? kodeRegistrasi;
  String? link;
  String? namaGame;
  String? statusGame;
  String? img;
  String? urut;

  ListGame(
      {this.idGame,
      this.kodeRegistrasi,
      this.link,
      this.namaGame,
      this.statusGame,
      this.img,
      this.urut});

  ListGame.fromJson(Map<String, dynamic> json) {
    idGame = json['id_game'];
    kodeRegistrasi = json['kode_registrasi'];
    link = json['link'];
    namaGame = json['nama_game'];
    statusGame = json['status_game'];
    img = json['img'];
    urut = json['urut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_game'] = this.idGame;
    data['kode_registrasi'] = this.kodeRegistrasi;
    data['link'] = this.link;
    data['nama_game'] = this.namaGame;
    data['status_game'] = this.statusGame;
    data['img'] = this.img;
    data['urut'] = this.urut;
    return data;
  }
}
