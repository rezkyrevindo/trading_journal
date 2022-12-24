class ListPromotionResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListPromotion>? data;

  ListPromotionResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListPromotionResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListPromotion>[];
      json['data'].forEach((v) {
        data!.add(new ListPromotion.fromJson(v));
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

class ListPromotion {
  String? idPromotion;
  String? title;
  String? content;
  String? img;
  String? createdAt;

  ListPromotion(
      {this.idPromotion, this.title, this.content, this.img, this.createdAt});

  ListPromotion.fromJson(Map<String, dynamic> json) {
    idPromotion = json['id_promotion'];
    title = json['title'];
    content = json['content'];
    img = json['img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_promotion'] = this.idPromotion;
    data['title'] = this.title;
    data['content'] = this.content;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    return data;
  }
}
