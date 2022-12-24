enum AssetsList {
  logo,
  stadium,
  togel,
  icEvent,
  icGames,
  icBola,
  icTogel,
  icBantuan,
  icChat,
  icLogout,
}

extension AssetsListExtension on AssetsList {
  String get name {
    switch (this) {
      case AssetsList.logo:
        return "assets/images/logo_new.jpeg";
      case AssetsList.stadium:
        return "assets/images/background_event_bola.jpg";
      case AssetsList.togel:
        return "assets/images/background_prediksi_togel.jpg";
      case AssetsList.icEvent:
        return "assets/icons/icon_event.png";
      case AssetsList.icGames:
        return "assets/icons/icon_games.png";
      case AssetsList.icBola:
        return "assets/icons/icon_bola.png";
      case AssetsList.icTogel:
        return "assets/icons/icon_togel.png";
      case AssetsList.icBantuan:
        return "assets/icons/icon_bantuan.png";
      case AssetsList.icChat:
        return "assets/icons/icon_chat.png";
      case AssetsList.icLogout:
        return "assets/icons/icon_logout.png";
      default:
        return "";
    }
  }
}
