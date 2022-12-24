class ListSettingResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ListSetting>? data;

  ListSettingResponse(
      {this.errorString,
      this.inputerror,
      this.message,
      this.status,
      this.data});

  ListSettingResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ListSetting>[];
      json['data'].forEach((v) {
        data!.add(new ListSetting.fromJson(v));
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

class ListSetting {
  String? idSetting;
  String? icon;
  String? namaWebsite;
  String? favicon;
  String? minimalWd;
  String? minimalDepo;
  String? kelipatanWd;
  String? kelipatanDepo;
  String? rules;
  String? lastUpdate;
  String? footer;
  String? description;
  String? keyword;
  String? youtube;
  String? runningText;
  String? cannonical;
  String? imgGame;
  String? imgGame1;
  String? popup;
  String? idLivechat;
  String? linkDownloadApk;
  String? imgSupport;
  String? imgBlog;
  String? meta;
  String? ogTitle;
  String? ogSiteName;
  String? ogDescription;
  String? googleSiteVerification;
  String? linkKlikPopup;

  ListSetting(
      {this.idSetting,
      this.icon,
      this.namaWebsite,
      this.favicon,
      this.minimalWd,
      this.minimalDepo,
      this.kelipatanWd,
      this.kelipatanDepo,
      this.rules,
      this.lastUpdate,
      this.footer,
      this.description,
      this.keyword,
      this.youtube,
      this.runningText,
      this.cannonical,
      this.imgGame,
      this.imgGame1,
      this.popup,
      this.idLivechat,
      this.linkDownloadApk,
      this.imgSupport,
      this.imgBlog,
      this.meta,
      this.ogTitle,
      this.ogSiteName,
      this.ogDescription,
      this.googleSiteVerification,
      this.linkKlikPopup});

  ListSetting.fromJson(Map<String, dynamic> json) {
    idSetting = json['id_setting'];
    icon = json['icon'];
    namaWebsite = json['nama_website'];
    favicon = json['favicon'];
    minimalWd = json['minimal_wd'];
    minimalDepo = json['minimal_depo'];
    kelipatanWd = json['kelipatan_wd'];
    kelipatanDepo = json['kelipatan_depo'];
    rules = json['rules'];
    lastUpdate = json['last_update'];
    footer = json['footer'];
    description = json['description'];
    keyword = json['keyword'];
    youtube = json['youtube'];
    runningText = json['running_text'];
    cannonical = json['cannonical'];
    imgGame = json['img_game'];
    imgGame1 = json['img_game_1'];
    popup = json['popup'];
    idLivechat = json['id_livechat'];
    linkDownloadApk = json['link_download_apk'];
    imgSupport = json['img_support'];
    imgBlog = json['img_blog'];
    meta = json['meta'];
    ogTitle = json['og_title'];
    ogSiteName = json['og_site_name'];
    ogDescription = json['og_description'];
    googleSiteVerification = json['google_site_verification'];
    linkKlikPopup = json['link_klik_popup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_setting'] = this.idSetting;
    data['icon'] = this.icon;
    data['nama_website'] = this.namaWebsite;
    data['favicon'] = this.favicon;
    data['minimal_wd'] = this.minimalWd;
    data['minimal_depo'] = this.minimalDepo;
    data['kelipatan_wd'] = this.kelipatanWd;
    data['kelipatan_depo'] = this.kelipatanDepo;
    data['rules'] = this.rules;
    data['last_update'] = this.lastUpdate;
    data['footer'] = this.footer;
    data['description'] = this.description;
    data['keyword'] = this.keyword;
    data['youtube'] = this.youtube;
    data['running_text'] = this.runningText;
    data['cannonical'] = this.cannonical;
    data['img_game'] = this.imgGame;
    data['img_game_1'] = this.imgGame1;
    data['popup'] = this.popup;
    data['id_livechat'] = this.idLivechat;
    data['link_download_apk'] = this.linkDownloadApk;
    data['img_support'] = this.imgSupport;
    data['img_blog'] = this.imgBlog;
    data['meta'] = this.meta;
    data['og_title'] = this.ogTitle;
    data['og_site_name'] = this.ogSiteName;
    data['og_description'] = this.ogDescription;
    data['google_site_verification'] = this.googleSiteVerification;
    data['link_klik_popup'] = this.linkKlikPopup;
    return data;
  }
}
