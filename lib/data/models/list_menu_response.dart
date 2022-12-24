class ListMenuResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListMenu>? data;

  ListMenuResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListMenuResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListMenu>[];
      json['data'].forEach((v) {
        data!.add(new ListMenu.fromJson(v));
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

class ListMenu {
  String? idMenuTogel;
  String? title;
  String? subtitle;
  String? img;
  String? linkClick;

  ListMenu(
      {this.idMenuTogel, this.title, this.subtitle, this.img, this.linkClick});

  ListMenu.fromJson(Map<String, dynamic> json) {
    idMenuTogel = json['id_menu_togel'];
    title = json['title'];
    subtitle = json['subtitle'];
    img = json['img'];
    linkClick = json['link_click'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_menu_togel'] = this.idMenuTogel;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['img'] = this.img;
    data['link_click'] = this.linkClick;
    return data;
  }
}
