enum UrlEnum {
  prosesLoginNew,
  logout,
  listPromosi,
  prediksiTogel,
  prediksiBola,
  prediksiBolaSukses,
  listKontak,
  settingWebsite,
  listSlot,
  listGame,
  participantEventbola,
  commentEventBola,
  detailEventBola,
  menuTogel,
  ads,
}

extension UrlEnumExtension on UrlEnum {
  static String baseUrl = "http://api2.pakanburungku.com";
  String get name {
    switch (this) {
      case UrlEnum.prosesLoginNew:
        return '$baseUrl/login/process_new';
      case UrlEnum.logout:
        return '$baseUrl/login/signout';
      case UrlEnum.listPromosi:
        return '$baseUrl/promotion/list';
      case UrlEnum.prediksiTogel:
        return '$baseUrl/prediction/list_togel';
      case UrlEnum.prediksiBola:
        return '$baseUrl/prediction/list_bola';
      case UrlEnum.prediksiBolaSukses:
        return '$baseUrl/prediction/list_success_bola';
      case UrlEnum.listKontak:
        return '$baseUrl/contact/lists';
      case UrlEnum.listSlot:
        return '$baseUrl/slot/list';
      case UrlEnum.settingWebsite:
        return '$baseUrl/setting/list';
      case UrlEnum.participantEventbola:
        return '$baseUrl/eventBola/participant';
      case UrlEnum.commentEventBola:
        return '$baseUrl/eventBola/comment';
      case UrlEnum.detailEventBola:
        return '$baseUrl/eventBola/detail';
      case UrlEnum.listGame:
        return '$baseUrl/game/list';
      case UrlEnum.menuTogel:
        return '$baseUrl/menu_togel/list';
      case UrlEnum.ads:
        return '$baseUrl/ads/list';
      default:
        return "";
    }
  }
}
