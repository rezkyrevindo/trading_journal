class ListTogelResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListTogel>? data;

  ListTogelResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListTogelResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListTogel>[];
      json['data'].forEach((v) {
        data!.add(new ListTogel.fromJson(v));
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

class ListTogel {
  String? idBerita;
  String? judul;
  String? content;
  String? img;
  Null? urutan;
  String? createdAt;

  ListTogel(
      {this.idBerita,
      this.judul,
      this.content,
      this.img,
      this.urutan,
      this.createdAt});

  ListTogel.fromJson(Map<String, dynamic> json) {
    idBerita = json['id_berita'];
    judul = json['judul'];
    content = json['content'];
    img = json['img'];
    urutan = json['urutan'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_berita'] = this.idBerita;
    data['judul'] = this.judul;
    data['content'] = this.content;
    data['img'] = this.img;
    data['urutan'] = this.urutan;
    data['created_at'] = this.createdAt;
    return data;
  }
}
