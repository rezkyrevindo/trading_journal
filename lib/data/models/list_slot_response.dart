class ListSlotResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListSlot>? data;

  ListSlotResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListSlotResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListSlot>[];
      json['data'].forEach((v) {
        data!.add(new ListSlot.fromJson(v));
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

class ListSlot {
  String? id;
  String? namaGame;
  String? linkGame;
  String? imgGame;

  ListSlot({this.id, this.namaGame, this.linkGame, this.imgGame});

  ListSlot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaGame = json['nama_game'];
    linkGame = json['link_game'];
    imgGame = json['img_game'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_game'] = this.namaGame;
    data['link_game'] = this.linkGame;
    data['img_game'] = this.imgGame;
    return data;
  }
}
